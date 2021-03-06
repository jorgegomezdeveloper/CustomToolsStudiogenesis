//
//  AddressTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import Foundation
import MapKit

extension String {
    
    public func openAddress(typeAddressResult: AddressTools.TypeAddressResult, completion: @escaping (Bool) -> ()) {

        AddressTools().openAddressActions(address: self, typeAddressResult: typeAddressResult) { (success) in
            
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}



public class AddressTools {

    public enum TypeAddressResult {
        case address
        case location
    }
    
    public init() {
        
    }
    
    
    func openAddressActions(address: String, typeAddressResult: TypeAddressResult, completion: @escaping (Bool) -> ()) {
                
        switch typeAddressResult {

        case .address:
            
            guard let address = URL(string: "http://maps.apple.com/?address=\(address)") else {
                completion(false)
                return
            }
            
            UIApplication.shared.open(address)
            completion(true)
            
            break
            
        case .location:
            
            self.coordinates(forAddress: address, completion: { (location) in
                
                if location != nil {
                    let query = "?ll=\(location!.latitude),\(location!.longitude)"
                    let path = "http://maps.apple.com/" + query
                    if let url = URL(string: path) {
                        UIApplication.shared.open(url)
                        completion(true)
                        
                    } else {
                        // Could not construct url. Handle error.
                        print("nop2")
                        completion(false)
                    }
                } else {
                    print("nop1")
                    completion(false)
                }
                
            })
            
            break
        }
    }
    
    
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
}
