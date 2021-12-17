//
//  TabBarView.swift
//  UWTickets+
//
//  Created by Paresh on 11/4/21.
//

import SwiftUI

struct TabBarView: View {
    @State var selection = 0
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
        
        
        TabView (selection: $selection){
            PersonalHomeView(gamesToPlay: games)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            MarketplaceView(listings: [])
                .tabItem{
                    Image(systemName: "cart")
                    Text("Market")
                }.tag(1)
            ChatView()
                .tabItem{
                    Image(systemName: "message")
                    Text("Chat")
                }.tag(2)
            ExchangeView2()
                .tabItem{
                    Image(systemName: "arrow.left.arrow.right.circle")
                    Text("Exchange")
                }.tag(3)
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(4)
        }.accentColor(.red)
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
