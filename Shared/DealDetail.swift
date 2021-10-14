//
//  DealDetail.swift
//  6S (iOS)
//
//  Created by Nicolas Desormiere on 14/10/21.
//

import SwiftUI

struct DealDetail : View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        Group {
            if let deal = router.selectedDeal {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Image(deal.image)
                            .resizable()
                            .scaledToFit()
                        Text(deal.name)
                            .font(.title)
                        Divider()
                        Text(deal.description)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .lineLimit(50)
                    }.padding().navigationBarTitle(Text(deal.name), displayMode: .inline)
                }
            } else {
                Text("Oh no - something's gone haywire")
            }
        }
        
    }
}

