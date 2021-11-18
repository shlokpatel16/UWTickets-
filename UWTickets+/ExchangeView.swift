//
//  ExchangeView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct oldOffer: Identifiable {
    var id = UUID()
    var name : String
    var sellingPrice : Double
    var buyingPrice : Double
    var average : Double
}

struct currentOffer: Identifiable {
    var id : Int
    var name : String
    var sellingPrice : Double
    var offerPrice : Double
}

struct HistoryList {
    static let dummyData = [
        oldOffer(name: "Penn State", sellingPrice: 30.00, buyingPrice: 30.00, average: 35.00 ),
        oldOffer(name: "Michigan", sellingPrice: 25.00, buyingPrice: 30.00, average: 27.00 ),
        oldOffer(name: "Northwestern", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 ),
        oldOffer(name: "Purdue", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 ),
        oldOffer( name: "Illinois", sellingPrice: 40.00, buyingPrice: 30.00, average: 35.00 )]
}

struct CurrentList {
    static let currentDummyData = [
        currentOffer(id : 1, name: "Penn State", sellingPrice: 30.00, offerPrice: 30.00),
        currentOffer(id : 2, name: "Michigan", sellingPrice: 25.00, offerPrice: 30.00),
        currentOffer(id : 3, name: "Northwestern", sellingPrice: 40.00, offerPrice: 30.00),
        currentOffer(id : 4, name: "Purdue", sellingPrice: 40.00, offerPrice: 30.00),
        currentOffer(id : 5, name: "Illinois", sellingPrice: 40.00, offerPrice: 30.00)]
}


struct ExchangeView: View {
    @State var isModal: Bool = false;
      var body: some View {
        NavigationView {
            VStack {

                    Button("Go to Current Offers Area") {
                        self.isModal = true;
                    }.sheet(isPresented: $isModal, content: {
                        OffersView()
                    })
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .foregroundColor(Color.black)
                    .background(Color.blue)
                    
                
                
                NavigationLink(destination: HistoryView()) {
                    
                    Button("Go to History Area") {
                        
                    }
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.black)         .padding(.vertical, 5)
                    .background(Color.blue)
                }

                Text("Buyer Name: ")
                Text("Ticket Price:")
                
                Button("Make Offer") {
                    
                }
                .padding(.trailing, 20)
                .padding(.vertical, 5)
                .foregroundColor(Color.black)
                
                .background(Color.green)            }
            .navigationBarTitle(Text("Exchange Area"))
        }
        
    }
}

struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
    }
}
