//
//  ExchangeView2.swift
//  UWTickets+
//
//  Created by Paresh on 11/19/21.
//

import SwiftUI

struct ExchangeView2: View {
    var filterGames = ["Choose Game", "Penn State", "Eastern MI", "Notre Dame", "Michigan", "Illinois", "Army", "Purdue", "Iowa", "Rutgers", "Northwestern", "Nebraska", "Minnesota"]
    @State private var filterGame = "Choose Game"
    var filterSellers = ["Choose Seller", "Shlok", "Jake", "Chris", "sampleuser1", "sampleruser2"]
    @State private var filterSeller = "Choose Seller"
    @State private var price: String = ""

    var body: some View {
        VStack {
            NavigationView {
                VStack{
                    HStack {
                        NavigationLink(destination: OffersView(currentOffers: dummyDataExchange)) {
                            Capsule()
                                .fill(Color.red)
                                .frame(width: 200, height: 100)
                                .overlay(
                                    Text("Current offers")
                                        .fontWeight(.semibold)
                                        .font(.title2)
                                        .foregroundColor(.black)
                                )
                        }
                        NavigationLink(destination: HistoryView(oldOffers: dummyData)) {
                            Capsule()
                                .fill(Color.red)
                                .frame(width: 200, height: 100)
                                .overlay(
                                    Text("Exchange History")
                                        .fontWeight(.semibold)
                                        .font(.title2)
                                        .foregroundColor(.black)
                                )
                                
                        }
                        
                    }.offset(y: -50)
                    Text("Make an Offer")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.vertical, 5)
                    HStack {
                        Text("Choose the Game:")
                        Spacer()

                        Picker("Filter by opponent", selection: $filterGame) {
                            ForEach(filterGames, id: \.self) {
                                Text($0)
                            }
                        }
                    }.padding(.horizontal, 75)
                    HStack {
                        Text("Choose the Seller:")
                        Spacer()
                        Picker("Filter by opponent", selection: $filterSeller) {
                            ForEach(filterSellers, id: \.self) {
                                Text($0)
                            }
                        }
                    }.padding(.horizontal, 75)
                    
                    HStack {
                        Text("Choose the Price: $")
                        Spacer()

                        TextField("ex. \"50\"", text: $price)
                            .frame(width: 100, height: 25)
                            .textFieldStyle(.roundedBorder)
                    }.padding(.horizontal, 75)
                    Button("Send Offer"){
                        
                    }
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding()
                    .background(Color.black)
                    .clipShape(Capsule())
                    .padding(.vertical, 50)

                }
                .navigationTitle("Exchange Area")
                

            }
        }

        
    }
}

struct ExchangeView2_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView2()
    }
}
