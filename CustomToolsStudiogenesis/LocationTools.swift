//
//  LocationTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import CoreLocation

public protocol LocationDeciveProtocol {
    func passLocationResult(latitude: Double?, longitude: Double?)
}

public class LocationTools: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var delegateLocationDevice: LocationDeciveProtocol?
    var locationSaved = false
    
    public override init() {
    }
    
    public func startService(delegate: LocationDeciveProtocol, desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest, completionError: @escaping (Bool) -> ()) {
        
        PermissionTools().checkLocationPermission { (status) in
            
            if status == 1 {
                self.askLocationPermission()
                completionError(false)
                
            } else if status == 2 {
                self.delegateLocationDevice = delegate
                self.locationSaved = false
                self.locationManager.delegate = self
                self.locationManager.desiredAccuracy = desiredAccuracy
                self.locationManager.startUpdatingLocation()
                completionError(false)
                
            } else {
                completionError(true)
                
            }
        }
    }
    
    public func askLocationPermission() {
        // Authorizations
        locationManager.requestAlwaysAuthorization() // Ask for Authorization from the User.
        locationManager.requestWhenInUseAuthorization() // For use in foreground
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {
            
            self.locationManager.stopUpdatingLocation()
            self.delegateLocationDevice?.passLocationResult(latitude: nil, longitude: nil)
            return
        }
        
        if !self.locationSaved {
    
            self.locationSaved = true
            self.locationManager.stopUpdatingLocation()
            self.delegateLocationDevice?.passLocationResult(latitude: locValue.latitude, longitude: locValue.longitude)
        }
    }
    
    public func getDistanceBetweenTwoLocations(firstLocation: CLLocation, secondLocation: CLLocation) -> String {
        
        let distance = firstLocation.distance(from: secondLocation)/1000
        let distanceFormatted = Double(round(100*distance)/100)
        
        if distanceFormatted < 1 {
            return "\(Int(distanceFormatted*1000)) m"
        } else {
            return "\(distanceFormatted) Km"
        }
    }

}
