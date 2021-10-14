//
//  ContentView.swift
//  Shared
//
//  Created by Ukko on 14/10/21.
//
import UserNotifications
import SwiftUI

struct ContentView: View {
    @ObservedObject var browser = BeaconBrowser()

    var body: some View {
        #if os(iOS)
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }

            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Deal of the day!"
                content.subtitle = "Buy one coffee get one free"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
    }
    #else
        Text("Hello World")
            .padding()
    #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
