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

    var deals: [Deal] = Deal.testData
    
    var body: some View {
#if os(iOS)
        NavigationView {
            List(deals) { deal in
                DealCell(deal: deal)
            }
            .navigationBarTitle(Text("Staff deals"))
            .onAppear {
                sendNotification()
            }
        }
#else
    Text("Hello World")
        .padding()
#endif
    }
}

func sendNotification() {
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

struct DealCell : View {
    let deal: Deal
    var body: some View {
        return NavigationLink(destination: DealDetail(name: deal.name, description: deal.description, image: deal.image)) {
            Image(deal.image)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(40)
            VStack(alignment: .leading) {
                Text(deal.name).font(.body)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
