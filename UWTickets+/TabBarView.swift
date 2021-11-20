//
//  TabBarView.swift
//  UWTickets+
//
//  Created by Paresh on 11/4/21.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        let games = [
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
        
        
        TabView {
            PersonalHomeView(gamesToPlay: games)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            MarketplaceView(listings: [])
                .tabItem{
                    Image(systemName: "cart")
                    Text("Market")
                }
            ChatView()
                .tabItem{
                    Image(systemName: "message")
                    Text("Chat")
                }
            ExchangeView2()
                .tabItem{
                    Image(systemName: "arrow.left.arrow.right.circle")
                    Text("Exchange")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }.accentColor(.red)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
