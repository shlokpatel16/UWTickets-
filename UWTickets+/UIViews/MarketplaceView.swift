//
//  MarketplaceView.swift
//  UWTickets+
//
//  Created by Chris George on 11/5/21.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct MarketplaceView: View {
    var filterGames = ["All", "Penn State", "Eastern MI", "Notre Dame", "Michigan", "Illinois", "Army", "Purdue", "Iowa", "Rutgers", "Northwestern", "Nebraska", "Minnesota"]
    @State private var filterGame = "All"
    @State var listings: [Listing]? = []
        
    
    var body: some View {
        let filteredListings = listings!.filter { listing in
            if filterGame == "All" {
                return true
            }
            return listing.game == filterGame
        }


        VStack{
            HStack {
                Text("Filter by opponent:")
                Picker("Filter by opponent", selection: $filterGame) {
                    ForEach(filterGames, id: \.self) {
                        Text($0)
                    }
                }
                .accessibility(identifier: "picker")
            }
            Text("Average asking price: \(getAveragePrice(listings: filteredListings).isNaN ? 0: getAveragePrice(listings: filteredListings), specifier: "$%.2f")")
                .accessibility(identifier: "marketAverage")
            List{
                ForEach(listings!.filter {$0.game == filterGame || filterGame == "All"}) {
                    Listing in MarketplaceListing(itemForSale: Listing)
                }
            }
            .accessibility(identifier: "marketTable")
        }.onAppear() {
            self.getMarketplace()
        }
        .padding(.vertical, 10)

    }
    
    func getMarketplace() {
        var listingSet = [Listing]()
        let ref = Database.database().reference()
        ref.child("Marketplace").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                let marketplace: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                for listing in marketplace {
                    listingSet.append(
                        Listing(
                            id: listing.key,
                            sellername: listing.value["sellername"] as! String,
                            game: listing.value["game"] as! String,
                            logo: listing.value["logo"] as! String,
                            askingPrice: listing.value["askingPrice"] as! String
                        )
                    )
                }
            }
            self.listings = listingSet

        }
    }
    
}






func getAveragePrice(listings: [Listing]) -> Double {
    var totalPrice = 0.00
    for listing in listings {
        totalPrice += Double(listing.askingPrice)!
    }
    return totalPrice / Double(listings.count)
}

struct MarketplaceListing: View {
    var itemForSale: Listing
    var body: some View {
        VStack {
            HStack {
                
            }
            HStack {
                Image(itemForSale.logo)
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 40, maxHeight: 40)
    //            Text(itemForSale.game)
                Spacer()
                Text(itemForSale.sellername).font(.system(size: 15.0))
//                Spacer()
            }
//            .padding(.vertical, 15)
            HStack {
                let askingPriceDouble = Double(itemForSale.askingPrice)
                Text("\(askingPriceDouble!, specifier: "$%.2f")")
                Spacer()
                Button("Message") {
                    db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                        if snapshot.exists() {
                            let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                            for user in users {
                                if user.value["name"] as! String == itemForSale.sellername {
                                    let userPhone =  user.value["phoneNumber"] as! String
                                    print(userPhone)
                                    let success = UIAlertController(title: "Message " + itemForSale.sellername, message: "You may reach " + itemForSale.sellername + " at this phone number: " + userPhone, preferredStyle: .alert)
                                    let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                                        
                                    }
                                    success.addAction(ok)
                                    UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                                        
                                    })
                                }
                            }
                        }
                    }
                }
                .accentColor(.blue)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.0)
                )
            }
        }
    }
}

struct Listing: Identifiable {
    var id: String
    var sellername: String
    var game: String
    var logo: String
//    var listed: String
    var askingPrice: String
}

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView(listings: [])
    }
}
