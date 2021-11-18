//
//  OffersView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct OffersView: View {
    var currentOffers : [currentOffer] = CurrentList.currentDummyData
    var body: some View {
        NavigationView {
            VStack {
                List(currentOffers, id: \.id) {item in
                    HStack() {
                        Text(item.name)
                        Text("Offer Price: " + String(item.offerPrice))
                            .font(.subheadline)
                            .foregroundColor(Color.red)
                        Text("Sell Price: " + String(item.sellingPrice))
                            .font(.subheadline)
                            .foregroundColor(Color.blue)
                        Button("Confirm") {
                        }
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(Color.gray)
                        )
                        
                        Button("Decline") {
                        }
                        .padding(.horizontal, 4)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(Color.gray)
                        )
                    }
                }
            NavigationLink(destination: ExchangeView()) {
                Button("Back to Exchange Area") {
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .stroke(Color.gray)
                )
            }
            
            
        }
        .navigationBarTitle(Text("All Current Offers"))
            }
    }
}
    /*
struct currentListRow: View {
    var eachOffer: currentOffer
    var body: some View {

            HStack {
                Text(eachOffer.name)
                Text("Offer Price: " + String(eachOffer.offerPrice))
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                Text("Sell Price: " + String(eachOffer.sellingPrice))
                        .font(.subheadline)
                        .foregroundColor(Color.blue)
                Button("Confirm") {
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .stroke(Color.gray)
                )
                
                Button("Decline") {
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .stroke(Color.gray)
                )
                
            }
        
        
    }
}
     */

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView()
    }
}

