//
//  BeaconAdvertiser.swift
//  6S
//
//  Created by Ukko on 14/10/21.
//

import CoreBluetooth
import CoreLocation

class BeaconAdvertiser: NSObject, CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            advertiseRegion()
        case .poweredOff:
            peripheral.stopAdvertising()
        default:
            dump(peripheral)
        }
    }
    
    override init() {
        manager = CBPeripheralManager()
        super.init()
        manager.delegate = self
    }
    
    var manager: CBPeripheralManager
    
    func advertiseRegion() {
        let advertisement = CBBeaconAvertisementData(
            proximityUUID: Beacon.id as NSUUID,
            major: Beacon.major,
            minor: Beacon.minor,
            measuredPower: -59
        ).beaconAdvertisement() as? [String: Any]
        manager.startAdvertising(advertisement)
    }
}

struct CBBeaconAvertisementData {
    var proximityUUID: NSUUID
    var major:  CLBeaconMajorValue
    var minor: CLBeaconMinorValue
    var measuredPower: Int8?
        
    init(proximityUUID: NSUUID?, major: CLBeaconMajorValue?, minor: CLBeaconMinorValue?, measuredPower: Int8?) {
        self.proximityUUID = proximityUUID!
        self.major = major!
        self.minor = minor!
        self.measuredPower = measuredPower
    }
    
    func beaconAdvertisement() -> NSDictionary? {
        let bufferSize = 21
        let beaconKey: NSString = "kCBAdvDataAppleBeaconKey";
        var advertisementBytes = [CUnsignedChar](repeating: 0, count: bufferSize)

        proximityUUID.getBytes(&advertisementBytes)
        
        advertisementBytes[16] = CUnsignedChar(major >> 8)
        advertisementBytes[17] = CUnsignedChar(major & 255)
        
        advertisementBytes[18] = CUnsignedChar(minor >> 8)
        advertisementBytes[19] = CUnsignedChar(minor & 255)
        
        // http://stackoverflow.com/a/25667091/3824765
        if let mp = measuredPower {
            advertisementBytes[20] = CUnsignedChar(bitPattern: mp)
        }
        
        // http://stackoverflow.com/questions/24196820/nsdata-from-byte-array-in-swift
        let advertisement = NSData(bytes: advertisementBytes, length: bufferSize)
        
        return NSDictionary(object: advertisement, forKey: beaconKey)
    }
}
