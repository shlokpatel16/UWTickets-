//
//  SettingsView.swift
//  UWTickets+
//
//  Created by Chris George on 11/5/21.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    @State private var saveCardInfo: Bool = false
    @State private var newEmail = ""
    @State private var newUsername = ""
    @State private var newPassword = ""
    @State private var newCardNo = ""
    @State private var newCVV = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Change Email", text: self.$newEmail)
                    .autocapitalization(.none)
                    .padding()
                    .accessibility(identifier: "settingsEmail")
                Button("Save") {
                    
                }
                .accentColor(.blue)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .accessibility(identifier: "saveEmail")
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.0)
                )
            }
            HStack {
                TextField("Change Username", text: self.$newUsername)
                    .autocapitalization(.none)
                    .padding()
                    .accessibility(identifier: "settingsUsername")
                Button("Save") {
                    
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
                TextField("Change Password", text: self.$newPassword)
                    .autocapitalization(.none)
                    .padding()
                    .accessibility(identifier: "settingsPassword")
                Button("Save") {
                    
                }
                .accentColor(.blue)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .accessibility(identifier: "savePassword")
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.0)
                )
            }
            HStack {
                TextField("Card No.", text: self.$newCardNo)
                    .autocapitalization(.none)
                    .padding()
                TextField("CVV", text: self.$newCVV)
                    .autocapitalization(.none)
                    .frame(width: 40)
                    .padding()
                Button("Save") {
                    
                }
                .accentColor(.blue)
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .background(
                    Capsule()
                        .stroke(Color.blue, lineWidth: 1.0)
                )
            }
            HStack {
                Toggle(isOn: $saveCardInfo) {
                Text("Save Card Information:")
                }
                .accessibility(identifier: "saveToggle")
            }
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
