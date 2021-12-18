//
//  ExchangeView2.swift
//  UWTickets+
//
//  Created by Paresh on 11/19/21.
//
import SwiftUI
import FirebaseAuth
import FirebaseDatabase

let db = Database.database().reference()

struct ExchangeView2: View {
    var filterGames = ["Choose Game", "Penn State", "Eastern MI", "Notre Dame", "Michigan", "Illinois", "Army", "Purdue", "Iowa", "Rutgers", "Northwestern", "Nebraska", "Minnesota"]
    @State private var filterGame = "Choose Game"
    @State var filterSellers = ["Choose Seller", "Shlok", "Jake", "Chris", "sampleuser1", "sampleruser2"]
    @State private var filterSeller = "Choose Seller"
    @State private var price: String = ""
    @State var buyer: String = ""

    var body: some View {
        VStack {
            NavigationView {
                VStack{
                    HStack {
                        NavigationLink(destination: OffersView(currentOffers: [])) {
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
                        NavigationLink(destination: HistoryView(oldOffers: [])) {
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
                        .onAppear() {
                            self.getSellerList()
                        }
                    
                    HStack {
                        Text("Choose the Price: $")
                        Spacer()

                        TextField("ex. \"50\"", text: $price)
                            .frame(width: 100, height: 25)
                            .textFieldStyle(.roundedBorder)
                    }.padding(.horizontal, 75)
                    Button("Send Offer"){
                        print(filterGame)
                        print(filterSeller)
                        print(price)
                        if filterGame == "Choose Game" {
                            let error = UIAlertController(title: "Invalid Game", message: "Please choose a Game for which you would like to make an offer!", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                                
                            }
                            error.addAction(ok)
                            UIApplication.shared.windows.first?.rootViewController?.present(error, animated: true, completion: {
                                
                            })
                        } else if filterSeller == "Choose Seller" {
                            let error = UIAlertController(title: "Invalid Seller", message: "Please choose a Seller for which you would like to make an offer!", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                                
                            }
                            error.addAction(ok)
                            UIApplication.shared.windows.first?.rootViewController?.present(error, animated: true, completion: {
                                
                            })
                        } else if (Int(price) == nil || Int(price)! < 0 || Int(price)! > 500) {
                            let error = UIAlertController(title: "Invalid Offer Price", message: "Please try again and enter a numerical value between 0 and 500!", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                                
                            }
                            error.addAction(ok)
                            UIApplication.shared.windows.first?.rootViewController?.present(error, animated: true, completion: {
                                
                            })
                        } else {
                            self.sendOffer()
                            let success = UIAlertController(title: "Successfully Sent Offer", message: "Your offer for a " + filterGame + " Ticket was successfully sent to " + filterSeller + " for a price of $" + price + "!", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                                
                            }
                            success.addAction(ok)
                            UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                                
                            })
                        }
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
    func getSellerList() {
        var sellers = [String]()
        db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                let uid = Auth.auth().currentUser!.uid
                for user in users {
                    if user.key != uid {
                        sellers.append(
                            user.value["name"] as! String
                        )
                    }
                }
                filterSellers = sellers
            }
        }
    }
    func sendOffer() {
        db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.exists() {
                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                for user in users {
                    if user.value["name"] as! String == filterSeller {
                        let uid = Auth.auth().currentUser!.uid
                        let seller = user.key
                        for user in users {
                            if user.key == uid {
                                buyer = user.value["name"] as! String
                            }
                        }
                            db.child("Users/" + seller + "/CurrentOffers").childByAutoId().setValue(["logo": filterGame, "price": price, "other person": buyer])
                    }
                }
            }
        }
    }
}


struct ExchangeView2_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView2()
    }
}
