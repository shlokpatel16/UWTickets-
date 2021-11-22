//
//  OffersView.swift
//  UWTickets+
//
//  Created by user206001 on 11/4/21.
//

import SwiftUI

struct OffersView: View {
    var currentOffers : [offer]
    var body: some View {
    NavigationView {
        VStack {
            List(currentOffers) {
                currentOffer in currentListRow(eachOffer: currentOffer)
            }
            
        }
        .navigationBarTitle(Text("All Current Offers"))
    }
    .padding(.bottom, 15)
    }
}
struct currentListRow: View {
    var eachOffer: offer
    var body: some View {
        HStack {
            Image(eachOffer.logo)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 40, maxHeight: 40)
            Spacer()
            Text(eachOffer.otherPerson)
        }
        
        HStack {
            let askingPriceDouble = Double(eachOffer.price)
            Text("\(askingPriceDouble!, specifier: "For $%.2f")")
            Spacer()
            Button("Accept") {
                withAnimation{
                }
                print("Accepted")
            }
            .buttonStyle(BorderlessButtonStyle())
            .accentColor(.green)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.green, lineWidth: 1.0)
            )
            Button("Decline") {
                withAnimation{
                }
                print("Declined")
            }
            .buttonStyle(BorderlessButtonStyle())
            .accentColor(.red)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .stroke(Color.red, lineWidth: 1.0)
            )
            
        }
    }
        
}

struct offer: Identifiable {
    var id : Int
    var logo : String
    var price : String
    var otherPerson : String
}

let offers = [
    offer(id : 1, logo: "PennLogo", price: "30.00", otherPerson: "testsellername"),
    offer(id : 2, logo: "MichLogo", price: "25.00", otherPerson: "cgeorge22@gmail.com"),
    offer(id : 3, logo: "NorthwesternLogo", price: "40.00", otherPerson: "shlok16patel@gmail.com"),
    offer(id : 4, logo: "PurdueLogo", price: "40.00", otherPerson: "anotherchris@gmail.com"),
    offer(id : 5, logo: "IllinoisLogo", price: "40.00", otherPerson: "testsellername"),
    offer(id : 6, logo: "NebraskaLogo", price: "45.00", otherPerson: "testsellername")]

struct OffersView_Previews: PreviewProvider {
    static var previews: some View {
        OffersView(currentOffers : offers)
    }
}
