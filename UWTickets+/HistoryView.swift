//
//  HistoryView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct HistoryView: View {
    
    var currentOffers : [offer]
    var body: some View {
        NavigationView {
            VStack {
                List(currentOffers) {
                    offer in ListRow(eachOffer: offer)
                }
                
                Button("Back to Exchange View") {
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .stroke(Color.gray)
                )
                
            }
            .navigationBarTitle(Text("Offer History"))
        }
    
    }
}

struct ListRow: View {
    var eachOffer: offer
    var body: some View {

            HStack {
                Text(eachOffer.name)
                Text("Buy Price: " + String(eachOffer.buyingPrice))
                        .font(.subheadline)
                        .foregroundColor(Color.red)
                Text("Sell Price: " + String(eachOffer.sellingPrice))
                        .font(.subheadline)
                        .foregroundColor(Color.blue)
                Text("Avg Price: " + String(eachOffer.average))
                        .font(.subheadline)
                        .foregroundColor(Color.green)
            }
    }
}

struct offer: Identifiable {
    var id : Int
    var name : String
    var sellingPrice : Double
    var buyingPrice : Double
    var average : Double
}

let dummyData = [
    offer(id : 1, name: "Penn State", sellingPrice: 30.00, buyingPrice: 30.00, average: 35.00 ),
    offer(id : 2, name: "Michigan", sellingPrice: 25.00, buyingPrice: 30.00, average: 27.00 ),
    offer(id : 3, name: "Northwestern", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 ),
    offer(id : 4, name: "Purdue", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 ),
    offer(id : 5, name: "Illinois", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 )]

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(currentOffers : dummyData)
    }
}
