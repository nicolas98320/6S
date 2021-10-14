//
//  ContentView.swift
//  6S (tvOS)
//
//  Created by Ukko on 14/10/21.
//

import SwiftUI

struct ContentView: View {
    var advertiser = BeaconAdvertiser()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: start)
    }
    
    func start() {
        advertiser.advertiseRegion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
