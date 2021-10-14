//
//  Beacon.swift
//  6S
//
//  Created by Ukko on 14/10/21.
//

import Foundation
import CoreLocation

enum Beacon {
    static let id = UUID(uuidString: "63D278B7-DEB8-4593-92C6-0F47A0D72C69")!
    static let major: CLBeaconMajorValue = 100
    static let minor: CLBeaconMajorValue = 1
    static let beaconID = "com.ace6s.advertiserRegion"
    
    enum Proximity: String {
        case far = "Far"
        case close = "Close"
        case veryClose = "Very close"
        case unknown = "Unknown"
    }
}

