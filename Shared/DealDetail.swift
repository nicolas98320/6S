//
//  DealDetail.swift
//  6S (iOS)
//
//  Created by Nicolas Desormiere on 14/10/21.
//

import SwiftUI

struct DealDetail : View {
    var name: String
    var description: String
    var image: String

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                Text(name)
                    .font(.title)
                Divider()
                Text(description)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .lineLimit(50)
                }.padding().navigationBarTitle(Text(name), displayMode: .inline)
        }
    }
}

