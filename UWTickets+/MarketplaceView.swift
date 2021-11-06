//
//  MarketplaceView.swift
//  UWTickets+
//
//  Created by Chris George on 11/5/21.
//

import SwiftUI

struct MarketplaceView: View {
    var listings: [Listing]
    var filterGames = ["All", "Penn State", "Eastern MI", "Notre Dame", "Michigan", "Illinois", "Army", "Purdue", "Iowa", "Rutgers", "Northwestern", "Nebraska", "Minnesota"]
    @State private var filterGame = "All"
    var body: some View {
        VStack{
            HStack {
                Text("Filter by opponent:")
                Picker("Filter by opponent", selection: $filterGame) {
                    ForEach(filterGames, id: \.self) {
                        Text($0)
                    }
                }
            }
            List(listings){
                Listing in MarketplaceListing(itemForSale: Listing)
            }
        }
        .padding(.vertical, 10)

    }
}

struct MarketplaceListing: View {
    var itemForSale: Listing
    var body: some View {
        HStack {
            Image(itemForSale.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 30, maxHeight: 30)
//            Text(itemForSale.game)
//            Spacer()
            Text(itemForSale.sellername).font(.system(size: 15.0))
            Text(String(format: "$%.2f", itemForSale.askingPrice))
            Spacer()
            Button("Message") {
                
            }
            .accentColor(.blue)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.blue, lineWidth: 1.0)
            )
        }
        .padding(.vertical, 15)
    }
}

struct Listing: Identifiable {
    var id: Int
    var sellername: String
    var game: String
    var logo: String
    var listed: Date
    var askingPrice: Double
}

var mockMarketplaceData = [
    Listing(id:1, sellername: "sampleuser1", game: "Northwestern", logo: "NorthwesternLogo", listed: Date(), askingPrice: 40.00),
    Listing(id:2, sellername: "sampleuser2", game: "Northwestern", logo: "NorthwesternLogo", listed: Date(), askingPrice: 50.00),
    Listing(id:3, sellername: "sampleuser3", game: "Northwestern", logo: "NorthwesternLogo", listed: Date(), askingPrice: 35.00),
    Listing(id:4, sellername: "sampleuser4", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 65.00),
    Listing(id:5, sellername: "sampleuser5", game: "Northwestern", logo: "NorthwesternLogo", listed: Date(), askingPrice: 40.00),
    Listing(id:6, sellername: "sampleuser6", game: "Northwestern", logo: "NorthwesternLogo", listed: Date(), askingPrice: 45.00),
    Listing(id:7, sellername: "sampleuser7", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 55.00),
    Listing(id:8, sellername: "sampleuser8", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 60.00),
    Listing(id:9, sellername: "sampleuser9", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 50.00),
    Listing(id:10, sellername: "sampleuser10", game: "Nebraska", logo: "NebraskaLogo", listed: Date(), askingPrice: 59.00)
]

struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView(listings: mockMarketplaceData)
    }
}
