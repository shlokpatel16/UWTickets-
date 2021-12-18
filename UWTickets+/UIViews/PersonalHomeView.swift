//
//  PersonalHomeView.swift
//  UWTickets+
//
//  Created by Paresh on 11/4/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

let database = Database.database().reference()

struct PersonalHomeView: View {
    var gamesToPlay: [game]
//    @Binding var selection = 3
//    self.selection = 2
    var body: some View {
        List(gamesToPlay) {
            game in ChatListRow(eachGame: game)
        }

    }
}

struct ChatListRow: View {
    var eachGame: game
    @State var nativeAlert = false
    @State var customAlert = false
    @State var dollars = ""
    @State private var showingSheet = false
    let nameToName:[String:String] = ["Penn State": "Penn State", "Eastern MI": "Eastern MI", "Notre Dame": "Notre Dame", "Michigan" : "Michigan", "@Illinois": "Illinois", "Army" : "Army", "@Purdue": "Purdue", "Iowa": "Iowa", "@Rutgers": "Rutgers", "Northwestern": "Northwestern", "Nebraska": "Nebraska", "@Minnesota": "Minnesota"]
//    @Binding var selection: Int
    
    var body: some View {
        HStack {
            Image(eachGame.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            Text(eachGame.name)
            Spacer()
            Button("Buy") {
                withAnimation{
//                    print(TabBarView().selection)
//                    TabBarView().selection = 4
//                    print(TabBarView().selection)
                    buy()
                }
                showingSheet.toggle()
                print("buy")
            }
            .buttonStyle(BorderlessButtonStyle())
            .accentColor(.green)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.green, lineWidth: 1.0)
            )
            .accessibility(identifier: eachGame.name + "buy")
            .sheet(isPresented: $showingSheet) {
                MarketplaceView(listings: [])
            }
            
            Button("Sell") {
                withAnimation{
                    sell()
                }
                print("sell")
            }
            .buttonStyle(BorderlessButtonStyle())
            .accentColor(.red)
            .padding(.horizontal, 20)
            .accessibility(identifier: eachGame.name + "sell")
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.red, lineWidth: 1.0)
            )
        }
    }
    func sell(){
        let alert = UIAlertController(title: "Sell Ticket", message: "Please enter the dollar amount (between 0 and 500) you are selling this ticket for: $", preferredStyle: .alert)
        alert.addTextField {(dollars) in
            dollars.placeholder = "ex. \"50\""
            
        }
        let sell = UIAlertAction(title: "Post Offer", style: .default) { _ in
            dollars = alert.textFields![0].text!
            if Int(dollars) != nil && Int(dollars)! >= 0 && Int(dollars)! <= 500{
                db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                    if snapshot.exists() {
                        let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                        let uid = Auth.auth().currentUser!.uid
                        for user in users {
                            if user.key == uid {
                                let userName =  user.value["name"] as! String
                                print(userName)
                                let realName = nameToName[eachGame.name]
                                database.child("Marketplace").childByAutoId().setValue(["sellername": userName, "game": realName, "logo": eachGame.logo, "askingPrice": dollars])
                            }
                        }
                    }
                }
                let success = UIAlertController(title: "Successfully Posted", message: "Your " + eachGame.name + " Ticket was successfully posted to our Market Place for an asking price of $" + dollars + "!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                    
                }
                success.addAction(ok)
                UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                    
                })
            } else {
                let error = UIAlertController(title: "Invalid Asking Price", message: "Please try again and enter a numerical value between 0 and 500!", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                    
                }
                error.addAction(ok)
                UIApplication.shared.windows.first?.rootViewController?.present(error, animated: true, completion: {
                    
                })
            }

        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            
        }
        alert.addAction(cancel)
        alert.addAction(sell)
        print(dollars)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {
            
        })

    }
    func buy(){
//        TabBarView().selection = 4
        MarketplaceView(listings: [])
    }
}


struct game: Identifiable {
    var id: Int
    var name: String
    var logo: String
}

var games = [
    game(id: 1, name: "Penn State", logo: "PennLogo"),
    game(id: 2, name: "Eastern MI", logo: "EasternLogo"),
    game(id: 3, name: "Notre Dame", logo: "NDLogo"),
    game(id: 4, name: "Michigan", logo: "MichLogo"),
    game(id: 5, name: "@Illinois", logo: "IllinoisLogo"),
    game(id: 6, name: "Army", logo: "ArmyLogo"),
    game(id: 7, name: "@Purdue", logo: "PurdueLogo"),
    game(id: 8, name: "Iowa", logo: "IowaLogo"),
    game(id: 9, name: "@Rutgers", logo: "RLogo"),
    game(id: 10, name: "Northwestern", logo: "NorthwesternLogo"),
    game(id: 11, name: "Nebraska", logo: "NebraskaLogo"),
    game(id: 12, name: "@Minnesota", logo: "MinnesotaLogo")
]

struct PersonalHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalHomeView(gamesToPlay: games)
    }
}
