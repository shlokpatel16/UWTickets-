//
//  UWTickets_App.swift
//  UWTickets+
//
//  Created by Jacob Sweis on 11/1/21.
//

import SwiftUI

@main
struct UWTickets_App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
