//
//  SettingsView.swift
//  UWTickets+
//
//  Created by Chris George on 11/5/21.
//

import SwiftUI

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
                TextField("Change Username", text: self.$newUsername)
                    .autocapitalization(.none)
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
                TextField("Change Password", text: self.$newPassword)
                    .autocapitalization(.none)
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