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
            }
            .navigationBarTitle(Text("Offer History"))
        }
        .padding(.bottom, 15)
    }
}

struct ListRow: View {
    var eachOffer: oldOffer
    var body: some View {
        HStack {
            Image(eachOffer.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            Spacer()
            let askingPriceDouble = Double(eachOffer.price)
            Text("\(askingPriceDouble!, specifier: "For $%.2f")")
        }
        HStack {
            if eachOffer.bought == true {
                Text("Bought from:")
                    .foregroundColor(.green)
            } else {
                Text("Sold To: ")
                    .foregroundColor(.red)
            }
            Spacer()
            Text(eachOffer.otherPerson)
        }
    }
}

struct oldOffer: Identifiable {
    var id : Int
    var logo : String
    var price : String
    var otherPerson : String
    var bought : Bool
}

let oldOffers = [
    oldOffer(id : 1, logo: "PennLogo", price: "30.00", otherPerson: "testsellername", bought: true),
    oldOffer(id : 2, logo: "MichLogo", price: "25.00", otherPerson: "cgeorge22@gmail.com", bought: false),
    oldOffer(id : 3, logo: "NorthwesternLogo", price: "40.00", otherPerson: "shlok16patel@gmail.com", bought: true),
    oldOffer(id : 4, logo: "PurdueLogo", price: "40.00", otherPerson: "anotherchris@gmail.com", bought: false),
    oldOffer(id : 5, logo: "IllinoisLogo", price: "40.00", otherPerson: "testsellername", bought: false),
    oldOffer(id : 6, logo: "NebraskaLogo", price: "45.00", otherPerson: "testsellername", bought: true)]

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(oldOffers : oldOffers)
    }
}
