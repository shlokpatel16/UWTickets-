//
//  ExchangeView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct ExchangeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OffersView(currentOffers: dummyDataExchange)) {
                    
                    Button("Go to Current Offers Area") {
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .stroke(Color.gray)
                    )
                }
                
                NavigationLink(destination: HistoryView(oldOffers: dummyData)) {
                    
                    Button("Go to Current Offers Area") {
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .stroke(Color.gray)
                    )
                }
            }
            .navigationBarTitle(Text("Exchange Area"))
        }
        
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
