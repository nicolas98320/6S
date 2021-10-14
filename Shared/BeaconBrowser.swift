//
//  BeaconBrowser.swift
//  ACE-6S
//
//  Created by Ukko on 14/10/21.
//

import CloudKit
import Combine
import CoreBluetooth
import CoreLocation
import SwiftUI

class BeaconBrowser: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var proximity: Beacon.Proximity = .unknown
    @Published var hasRedeemed: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    private let locationManager = CLLocationManager()
    
    
    override init() {
        super.init()
        locationManager.delegate = self
        $proximity.debounce(for: 1.0, scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap { $0 }
            .filter { $0 == .close || $0 == .veryClose }
            .receive(on: RunLoop.main)
            .sink { _ in
                sendNotification()
                self.stopMonitoringBeacons()
            }.store(in: &cancellables)
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
                proximity = .unknown
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
    
    private let beaconIdentity = CLBeaconIdentityConstraint(uuid: Beacon.id, major: Beacon.major, minor: Beacon.minor)
    
    private func stopMonitoringBeacons() {
        locationManager.stopRangingBeacons(satisfying: beaconIdentity)
    }
    
    private func monitorBeacons() {
        if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
            locationManager.startRangingBeacons(satisfying: beaconIdentity)
        }
    }
}
