//
//  TabBarView.swift
//  UWTickets+
//
//  Created by Paresh on 11/4/21.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
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
        
        TabView {
            PersonalHomeView(gamesToPlay: games)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            MarketplaceView(listings: mockMarketplaceData)
                .tabItem{
                    Image(systemName: "cart")
                    Text("Market")
                }
            ChatView()
                .tabItem{
                    Image(systemName: "message")
                    Text("Chat")
                }
            Text("Exchange")
                .tabItem{
                    Image(systemName: "arrow.left.arrow.right.circle")
                    Text("Exchange")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
