//
//  BeaconBrowser.swift
//  ACE-6S
//
//  Created by Ukko on 14/10/21.
//

import CoreBluetooth
import CoreLocation
import SwiftUI

class BeaconBrowser: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var proximity: Beacon.Proximity? = nil
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    
    func startBrowsing() {
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let first = beacons.first {
            switch first.proximity {
            case .immediate:
                proximity = .veryClose
            case .near:
                proximity = .close
            case .far:
                proximity = .far
            default:
                proximity = nil
            }
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorized, .authorizedAlways, .authorizedWhenInUse:
            monitorBeacons()
        case .denied:
            fatalError("Denied access to location")
        case .notDetermined:
            break
        case .restricted:
            break;
        @unknown default:
            break;
        }
    }
    
    private func monitorBeacons() {
        if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
            locationManager.startRangingBeacons(
                satisfying: .init(uuid: Beacon.id, major: Beacon.major, minor: Beacon.minor)
            )
        }
    }
}
