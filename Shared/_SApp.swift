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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .onAppear(perform: { appDelegate.router = router })
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    // add app delegate methods here
    weak var router: Router?
    
    let center = UNUserNotificationCenter.current()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        center.delegate = self
        center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        application.registerForRemoteNotifications()
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        router?.hasRedeemed = true
        completionHandler(.banner)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        router?.hasRedeemed = true
        completionHandler()
    }
}

class Router: ObservableObject {
    @Published var selectedDeal: Deal? = nil
    @Published var deals = Deal.testData
    @Published var hasRedeemed = false
}
