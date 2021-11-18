//
//  AppDelegate.swift
//  UWTickets+
//
//  Created by Jacob Sweis on 11/4/21.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()

        return true
        
    }
}
