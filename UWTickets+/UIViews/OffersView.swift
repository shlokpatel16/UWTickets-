//
//  OffersView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct OffersView: View {
    var currentOffers : [currentOffer]    
    var body: some View {
    NavigationView {
        VStack {
            List(currentOffers) {
                currentOffer in currentListRow(eachOffer: currentOffer)
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

struct currentOffer: Identifiable {
    var id : Int
    var name : String
    var sellingPrice : Double
    var offerPrice : Double
}

let dummyDataExchange = [
    currentOffer(id : 1, name: "Penn State", sellingPrice: 30.00, offerPrice: 30.00),
    currentOffer(id : 2, name: "Michigan", sellingPrice: 25.00, offerPrice: 30.00),
    currentOffer(id : 3, name: "Northwestern", sellingPrice: 40.00, offerPrice: 30.00),
    currentOffer(id : 4, name: "Purdue", sellingPrice: 40.00, offerPrice: 30.00),
    currentOffer(id : 5, name: "Illinois", sellingPrice: 40.00, offerPrice: 30.00)]

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView(currentOffers : dummyDataExchange)
    }
}
