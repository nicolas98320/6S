//
//  _SApp.swift
//  Shared
//
//  Created by Ukko on 14/10/21.
//
import UserNotifications
import SwiftUI

@main
struct _SApp: App {
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    init() {
        requestAuthorization()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
