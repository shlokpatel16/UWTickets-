//
//  SettingsView.swift
//  UWTickets+
//
//  Created by Chris George on 11/5/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase


struct SettingsView: View {
    @State private var saveCardInfo: Bool = false
    @State private var newEmail = ""
    @State private var newUsername = ""
    @State private var newPhone = ""
    @State private var newCardNo = ""
    @State private var newCVV = ""
    
    var body: some View {
        VStack {
//            HStack {
//                TextField("Change Email", text: self.$newEmail)
//                    .autocapitalization(.none)
//                    .padding()
//                    .accessibility(identifier: "settingsEmail")
//                Button("Save") {
//
//                }
//                .accentColor(.blue)
//                .padding(.horizontal, 15)
//                .padding(.vertical, 5)
//                .accessibility(identifier: "saveEmail")
//                .background(
//                    Capsule()
//                        .stroke(Color.blue, lineWidth: 1.0)
//                )
//            }
            HStack {
                Text("Change Credentials")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 35)
                
            }.padding(.bottom, 100)
            HStack {
                TextField("Enter new Username", text: self.$newUsername)
                    .autocapitalization(.none)
                    .padding()
                    .accessibility(identifier: "settingsUsername")
                Button("Save") {
                    if !newUsername.trimmingCharacters(in: .whitespaces).isEmpty {
                        db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                            if snapshot.exists() {
                                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                let uid = Auth.auth().currentUser!.uid
                                for user in users {
                                    if user.key == uid {
                                        for user in users {
                                            if user.key == uid {
                                                let oldName = user.value["name"] as! String
                                                db.child("Users/" + uid + "/name").setValue(newUsername)
                                                
                                                
                                                let ref = Database.database().reference()
                                                ref.child("Marketplace").observeSingleEvent(of: .value) { (snapshot) in
                                                    print("the market snapshot")
                                                    print(snapshot)
                                                    print(oldName)
                                                    if snapshot.exists() {
                                                        let market: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
//                                                        let uid = Auth.auth().currentUser!.uid
                                                        for entry in market {
                                                            if entry.value["sellername"] as! String == oldName {
                                                                let path = "Marketplace/" + entry.key + "/sellername"
                                                                ref.child(path).setValue(newUsername)
                                                            }
                                                        }
                                                    }
                                                }
                                                
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        let success = UIAlertController(title: "Successfully Changed Username", message: "Your username was changed to " + newUsername + "!", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                            
                        }
                        success.addAction(ok)
                        UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                            
                        })
                    } else {
                        let error = UIAlertController(title: "Invalid Username", message: "Please try again and enter a username with non whitespace characters in it!", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                            
                        }
                        error.addAction(ok)
                        UIApplication.shared.windows.first?.rootViewController?.present(error, animated: true, completion: {
                            
                        })
                    }
                }
                .accentColor(.blue)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .accessibility(identifier: "saveUsername")
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.0)
                )
            }
            HStack {
                TextField("Enter new Phone Number", text: self.$newPhone)
                    .autocapitalization(.none)
                    .padding()
                    .accessibility(identifier: "settingsPassword")
                Button("Save") {
                    if newPhone.count == 10 && Int(newPhone) != nil{
                        db.child("Users").observeSingleEvent(of: .value) { (snapshot) in
                            if snapshot.exists() {
                                let users: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
                                let uid = Auth.auth().currentUser!.uid
                                for user in users {
                                    if user.key == uid {
                                        for user in users {
                                            if user.key == uid {
                                                let oldLine = user.value["phoneNumber"] as! String
                                                let name = user.value["name"] as! String

                                                db.child("Users/" + uid + "/phoneNumber").setValue(newPhone)
                                                
                                                
                                                let ref = Database.database().reference()
                                                ref.child("Marketplace").observeSingleEvent(of: .value) { (snapshot) in
                                                    print("the market snapshot")
                                                    print(snapshot)
                                                    print(oldLine)
                                                    if snapshot.exists() {
                                                        let market: [String: [String:Any]] = snapshot.value as! [String: [String:Any]]
//                                                        let uid = Auth.auth().currentUser!.uid
                                                        for entry in market {
                                                            if entry.value["sellername"] as! String == name {
                                                                let path = "Marketplace/" + entry.key + "/phoneNumber"
                                                                ref.child(path).setValue(newPhone)
                                                            }
                                                        }
                                                    }
                                                }
                                                
                                                
                                                
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        let success = UIAlertController(title: "Successfully Changed Phone Number", message: "Your phone number was changed to " + newPhone, preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                            
                        }
                        success.addAction(ok)
                        UIApplication.shared.windows.first?.rootViewController?.present(success, animated: true, completion: {
                            
                        })
                    } else {
                        let error = UIAlertController(title: "Invalid Phone Number", message: "Please try again and enter a 10 digit, only numerical, phone number!", preferredStyle: .alert)
                        let ok = UIAlertAction(title: "Ok", style: .destructive) { _ in
                            
                        }
                        error.addAction(ok)
                        UIApplication.shared.windows.first?.rootViewController?.present(error, animated: true, completion: {
                            
                        })
                    }

                }
                .accentColor(.blue)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .accessibility(identifier: "savePassword")
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.0)
                )
            }.padding(.bottom, 100)
//            HStack {
//                TextField("Card No.", text: self.$newCardNo)
//                    .autocapitalization(.none)
//                    .padding()
//                TextField("CVV", text: self.$newCVV)
//                    .autocapitalization(.none)
//                    .frame(width: 40)
//                    .padding()
//                Button("Save") {
//
//                }
//                .accentColor(.blue)
//                .padding(.horizontal, 15)
//                .padding(.vertical, 5)
//                .background(
//                    Capsule()
//                        .stroke(Color.blue, lineWidth: 1.0)
//                )
//            }
//            HStack {
//                Toggle(isOn: $saveCardInfo) {
//                Text("Save Card Information:")
//                }
//                .accessibility(identifier: "saveToggle")
//            }
            HStack {
                Button(action: {
                    
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }) {
                    
                    Text("Log out")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
                .accessibilityIdentifier("logoutButton")
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, 100)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
