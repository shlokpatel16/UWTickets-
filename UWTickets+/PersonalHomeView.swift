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
            .sheet(isPresented: $showingSheet) {
                MarketplaceView(listings: mockMarketplaceData)
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
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.red, lineWidth: 1.0)
            )
        }
    }
    func sell(){
        let alert = UIAlertController(title: "Sell Ticket", message: "Please enter the dollar amount you are selling this ticket for: $", preferredStyle: .alert)
        alert.addTextField {(dollars) in
            dollars.placeholder = "ex. \"50\""
            
        }
        let sell = UIAlertAction(title: "Post Offer", style: .default) { _ in
            dollars = alert.textFields![0].text!
            print(dollars)
            print(eachGame.name)
            database.child("Tickets").child(eachGame.name).setValue(["Price": dollars])
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
        MarketplaceView(listings: mockMarketplaceData)
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
