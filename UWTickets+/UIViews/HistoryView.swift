//
//  HistoryView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct HistoryView: View {
    
    @State var oldOffers : [oldOffer]? = []
    let nameToLogo:[String:String] = ["Penn State": "PennLogo", "Eastern MI": "EasternLogo", "Notre Dame": "NDLogo", "Michigan" : "MichLogo", "Illinois": "IllinoisLogo", "Army" : "ArmyLogo", "Purdue": "PurdueLogo", "Iowa": "IowaLogo", "Rutgers": "RLogo", "Northwestern": "NorthwesternLogo", "Nebraska": "NebraskaLogo", "Minnesota": "MinnesotaLogo"]
    var body: some View {
        NavigationView {
            VStack {
                List(oldOffers!) {
                    oldOffer in ListRow(eachOffer: oldOffer)
                }
            }
            .navigationBarTitle(Text("Offer History"))
            .onAppear() {
                self.getHistory()
            }
        }
        .padding(.bottom, 15)
    }
    func getHistory() {
        var historySet = [oldOffer]()
        let ref = Database.database().reference()
        ref.child("Users").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                let uid = Auth.auth().currentUser!.uid
                for user in users {
                    if user.key == uid {
                        let path = "Users/" + uid + "/history"
                        print(path)
                        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
                            print("here the snap")
                            print(snapshot)
                            if snapshot.exists() {
                                let offers: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                for singleOffer in offers {
                                    print("thisis a single offer")
                                    print(singleOffer)
                                    historySet.append(
                                        oldOffer(
                                            id: singleOffer.key,
                                            logo: singleOffer.value["logo"] as! String,
                                            price: singleOffer.value["price"] as! String,
                                            otherPerson: singleOffer.value["other person"] as! String,
                                            bought: singleOffer.value["bought"] as! Int
                                        )
                                    )
                                }
                            }
                            print("current offers heree")
                            print(historySet)
                            self.oldOffers = historySet
                        }
                    }
                }
            }
        }
    }
}

struct ListRow: View {
    var eachOffer: oldOffer
    var body: some View {
        HStack {
            Image(eachOffer.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            Spacer()
            let askingPriceDouble = Double(eachOffer.price)
            Text("\(askingPriceDouble!, specifier: "For $%.2f")")
        }
        HStack {
            if eachOffer.bought == 1 {
                Text("Bought from:")
                    .foregroundColor(.green)
            } else {
                Text("Sold To: ")
                    .foregroundColor(.red)
            }
            Spacer()
            Text(eachOffer.otherPerson)
        }
    }
}

struct oldOffer: Identifiable {
    var id : String
    var logo : String
    var price : String
    var otherPerson : String
    var bought : Int
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(oldOffers : [])
    }
}
