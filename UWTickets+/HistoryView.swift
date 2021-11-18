//
//  HistoryView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct HistoryView: View {
    
    var oldOffers : [oldOffer] = HistoryList.dummyData
    var body: some View {
        NavigationView {
            VStack {
                List(oldOffers, id: \.id) {item in
                    HStack() {
                        Text(item.name)
                        Text("Buy Price: " + String(item.buyingPrice))
                                .font(.subheadline)
                                .foregroundColor(Color.red)
                        Text("Sell Price: " + String(item.sellingPrice))
                                .font(.subheadline)
                                .foregroundColor(Color.blue)
                        Text("Avg Price: " + String(item.average))
                                .font(.subheadline)
                                .foregroundColor(Color.green)                    }
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

/*
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
 */





struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
