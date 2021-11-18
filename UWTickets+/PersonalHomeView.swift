//
//  PersonalHomeView.swift
//  UWTickets+
//
//  Created by Paresh on 11/4/21.
//

import SwiftUI

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
    var body: some View {
        HStack {
            Image(eachGame.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            Text(eachGame.name)
            Spacer()
            Button("Buy") {
                
            }
            .accentColor(.green)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.green, lineWidth: 1.0)
            )
            
            Button("Sell") {
                
            }
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
