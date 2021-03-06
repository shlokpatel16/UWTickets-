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
    let nameToLogo:[String:String] = ["Penn State": "PennLogo", "Eastern MI": "EasternLogo", "Notre Dame": "NDLogo", "Michigan" : "MichLogo", "Illinois": "IllinoisLogo", "Army" : "ArmyLogo", "Purdue": "PurdueLogo", "Iowa": "IowaLogo", "Rutgers": "RLogo", "Northwestern": "NorthwesternLogo", "Nebraska": "NebraskaLogo", "Minnesota": "MinnesotaLogo"]
    var body: some View {
    NavigationView {
        VStack {
            List(currentOffers!) {
                offer in currentListRow(eachOffer: offer)
            }
            
        }
        .navigationBarTitle(Text("All Current Offers"))
        .onAppear() {
            self.getOffers()
        }
    }
    .padding(.bottom, 15)
    }
    func getOffers() {
        var offerSet = [offer]()
        let ref = Database.database().reference()
        ref.child("Users").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                let uid = Auth.auth().currentUser!.uid
                for user in users {
                    if user.key == uid {
                        let path = "Users/" + uid + "/CurrentOffers"
                        print(path)
                        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
                            print("here the snap")
                            print(snapshot)
                            if snapshot.exists() {
                                let offers: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                for singleOffer in offers {
                                    print("thisis a single offer")
                                    print(singleOffer)
                                    let realLogo = nameToLogo[singleOffer.value["logo"] as! String]
                                    offerSet.append(
                                        offer(
                                            id: singleOffer.key,
                                            logo: realLogo!,
                                            price: singleOffer.value["price"] as! String,
                                            otherPerson: singleOffer.value["other person"] as! String
                                        )
                                    )
                                }
                            }
                            print("current offers heree")
                            print(offerSet)
                            self.currentOffers = offerSet
                        }
                    }
                }
            }
        }
    }
    struct currentListRow: View {
        let logoToName:[String:String] = ["PennLogo": "Penn State", "EasternLogo": "Eastern MI", "NDLogo": "Notre Dame", "MichLogo" : "Michigan", "IllinoisLogo": "Illinois", "ArmyLogo" : "Army", "PurdueLogo": "Purdue", "IowaLogo": "Iowa", "RLogo": "Rutgers", "NorthwesternLogo": "Northwestern", "NebraskaLogo": "Nebraska", "MinnesotaLogo": "Minnesota"]
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
                        db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                            if snapshot.exists() {
                                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                for user in users {
                                    let uid = Auth.auth().currentUser!.uid
                                    let seller = user.key
                                    if user.key == uid {
                                        db.child("Users/" + seller + "/history").childByAutoId().setValue(["logo": eachOffer.logo, "price": eachOffer.price, "other person": eachOffer.otherPerson, "bought": 0])
                                    }
                                }
                                for user in users {
                                    _ = Auth.auth().currentUser!.uid
                                    print("ooooooga")
                                    let other = user.value["name"] as! String
                                    let buyer = user.key
                                    if other == eachOffer.otherPerson {
                                        db.child("Users/" + buyer + "/history").childByAutoId().setValue(["logo": eachOffer.logo, "price": eachOffer.price, "other person": eachOffer.otherPerson, "bought": 1])
                                    }
                                }
                            }
                        }
                        
                        _ = [offer]()
                        let ref = Database.database().reference()
                        ref.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                            if snapshot.exists() {
                                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                let uid = Auth.auth().currentUser!.uid
                                for user in users {
                                    if user.key == uid {
                                        let path = "Users/" + uid + "/CurrentOffers/" + eachOffer.id
                                        print(path)
                                        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
                                            print("here the snap")
                                            print(snapshot)
                                        }
                                        ref.child(path).removeValue()
                                    }
                                }
                            }
                        }
                    }
                    print("Accepted")
                    let ticket = String(logoToName[eachOffer.logo]!)
                    let success = UIAlertController(title: "You Accepted " + eachOffer.otherPerson + "'s Offer", message: "You just exchanged your " + ticket + " Ticket with " + eachOffer.otherPerson + " for $" + eachOffer.price + "!", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                        
                    }
                    success.addAction(ok)
                    UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                        
                    })
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
                        print(eachOffer.id)
                        _ = [offer]()
                        let ref = Database.database().reference()
                        ref.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                            if snapshot.exists() {
                                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                let uid = Auth.auth().currentUser!.uid
                                for user in users {
                                    if user.key == uid {
                                        let path = "Users/" + uid + "/CurrentOffers/" + eachOffer.id
                                        print(path)
                                        ref.child(path).observeSingleEvent(of: .value) { (snapshot) in
                                            print("here the snap")
                                            print(snapshot)
                                        }
                                        ref.child(path).removeValue()
                                    }
                                }
                            }
                        }
                        
                    }
                    print("Declined")
                    let ticket = String(logoToName[eachOffer.logo]!)
                    let success = UIAlertController(title: "You Declined " + eachOffer.otherPerson + "'s Offer", message: "You did not exchange your " + ticket + " Ticket with " + eachOffer.otherPerson + " for $" + eachOffer.price + "!", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                        
                    }
                    success.addAction(ok)
                    UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                        
                    })
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

    }


struct offer: Identifiable {
    var id : String
    var logo : String
    var price : String
    var otherPerson : String
}

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView(currentOffers : [])
    }
}
