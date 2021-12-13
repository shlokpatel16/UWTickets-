//
//  OffersView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct OffersView: View {
    @State var currentOffers : [offer]? = []
    var nameToLogo:[String:String] = ["Penn State": "PennLogo", "Eastern MI": "EasternLogo", "Notre Dame": "NDLogo", "Michigan" : "MichLogo", "Illinois": "IllinoisLogo", "Army" : "ArmyLogo", "Purdue": "PurdueLogo", "Iowa": "IowaLogo", "Rutgers": "RLogo", "Northwestern": "NorthwesternLogo", "Nebraska": "NebraskaLogo", "Minnesota": "MinnesotaLogo"]
    var body: some View {
    NavigationView {
        VStack {
            List(currentOffers!) {
                offer in currentListRow(eachOffer: offer)
            }
            
        }
        .navigationBarTitle(Text("All Current Offers"))
        .onAppear() {
            getOffers()
        }
    }
    .padding(.bottom, 15)
    }
    func getOffers() {
        var offerSet = [offer]()
        let ref = Database.database().reference()
        ref.child("Users").observeSingleEvent(of: .value) { (snapshot) in
            let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
            let uid = Auth.auth().currentUser!.uid
            for user in users {
                if user.key == uid {
                    var path = "Users/" + uid + "/CurrentOffers"
                    print(path)
                    ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
                        print("here the snap")
                        print(snapshot)
                        let offers: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                        for singleOffer in offers {
                            print("thisis a single offer")
                            print(singleOffer)
                            var realLogo = nameToLogo[singleOffer.value["logo"] as! String]
                            offerSet.append(
                                offer(
                                    id: singleOffer.key,
                                    logo: realLogo!,
                                    price: singleOffer.value["price"] as! String,
                                    otherPerson: singleOffer.value["other person"] as! String
                                )
                            )
                        }
                        print("current offers heree")
                        print(offerSet)
                        self.currentOffers = offerSet
                    }
                }
//                print("past users")
            }
        }
//        print("current offers heree")
//        print(offerSet)
//        self.currentOffers = offerSet
    }
}
struct currentListRow: View {
    var eachOffer: offer
    var body: some View {
        HStack {
            Image(eachOffer.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            Spacer()
            Text(eachOffer.otherPerson)
        }
        
        HStack {
            let askingPriceDouble = Double(eachOffer.price)
            Text("\(askingPriceDouble!, specifier: "For $%.2f")")
            Spacer()
            Button("Accept") {
                withAnimation{
                }
                print("Accepted")
            }
            .buttonStyle(BorderlessButtonStyle())
            .accentColor(.green)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.green, lineWidth: 1.0)
            )
            Button("Decline") {
                withAnimation{
                }
                print("Declined")
            }
            .buttonStyle(BorderlessButtonStyle())
            .accentColor(.red)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.red, lineWidth: 1.0)
            )
            
        }
    }
}

struct offer: Identifiable {
    var id : String
    var logo : String
    var price : String
    var otherPerson : String
}
//let offers = [
//    offer(id : 1, logo: "PennLogo", price: "30.00", otherPerson: "testsellername"),
//    offer(id : 2, logo: "MichLogo", price: "25.00", otherPerson: "cgeorge22@gmail.com"),
//    offer(id : 3, logo: "NorthwesternLogo", price: "40.00", otherPerson: "shlok16patel@gmail.com"),
//    offer(id : 4, logo: "PurdueLogo", price: "40.00", otherPerson: "anotherchris@gmail.com"),
//    offer(id : 5, logo: "IllinoisLogo", price: "40.00", otherPerson: "testsellername"),
//    offer(id : 6, logo: "NebraskaLogo", price: "45.00", otherPerson: "testsellername")]

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView(currentOffers : [])
    }
}
