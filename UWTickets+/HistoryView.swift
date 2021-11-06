//
//  HistoryView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct HistoryView: View {
    
    var oldOffers : [oldOffer]
    var body: some View {
        NavigationView {
            VStack {
                List(oldOffers) {
                    oldOffer in ListRow(eachOffer: oldOffer)
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
            .navigationBarTitle(Text("Offer History"))
        }
    
    }
}

struct ListRow: View {
    var eachOffer: oldOffer
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

struct oldOffer: Identifiable {
    var id : Int
    var name : String
    var sellingPrice : Double
    var buyingPrice : Double
    var average : Double
}

let dummyData = [
    oldOffer(id : 1, name: "Penn State", sellingPrice: 30.00, buyingPrice: 30.00, average: 35.00 ),
    oldOffer(id : 2, name: "Michigan", sellingPrice: 25.00, buyingPrice: 30.00, average: 27.00 ),
    oldOffer(id : 3, name: "Northwestern", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 ),
    oldOffer(id : 4, name: "Purdue", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 ),
    oldOffer(id : 5, name: "Illinois", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 )]

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(oldOffers : dummyData)
    }
}
