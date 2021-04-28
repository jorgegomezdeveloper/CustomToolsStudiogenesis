//
//  PermissionTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import UserNotifications
import AVFoundation
import CoreLocation
import Photos

public class PermissionTools {
    
    public init() {
        
    }
    
    // MARK: NOTIFICATIONS PERMISSION STATUS
    public func checkNotificationPermission(completion: @escaping (Bool) -> ()) {
        
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            
            if settings.authorizationStatus == .authorized {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // MARK: LOCATION PERMISSION STATUS
    public func checkLocationPermission(completion: @escaping (Int) -> ()) {
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch CLLocationManager.authorizationStatus() {
                
            case .restricted, .denied:
                completion(0)
            case .notDetermined:
                completion(1)
            case .authorizedAlways, .authorizedWhenInUse:
                completion(2)
            @unknown default:
                completion(0)
            }
        } else {
            completion(0)
        }
    }
    
    // MARK: MICROPHONE PERMISSION STATUS
    public enum MicrophonePermissionStatus {
        case granted
        case denied
        case undetermined
    }
    
    public func checkMicrophonePermission(completionStatus: @escaping (MicrophonePermissionStatus) -> ()) {
        
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSessionRecordPermission.granted:
            completionStatus(.granted)
        case AVAudioSessionRecordPermission.denied:
            completionStatus(.denied)
        case AVAudioSessionRecordPermission.undetermined:
            
            self.askMicrophonePermission { (granted) in
                
                if granted {
                    completionStatus(.granted)
                } else {
                    completionStatus(.denied)
                }
            }
            
        default:
            completionStatus(.denied)
            break
        }
        
    }
    
    public func askMicrophonePermission(grantedValue: @escaping (Bool) -> ()) {
        
        AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
            if granted {
                grantedValue(true)
            } else {
                grantedValue(false)
            }
        })
    }
    
    // MARK: CAMERA PERMISSION STATUS
    public enum VideoPermissionStatus {
        case granted
        case denied
        case restricted
        case notDetermined
    }
    
    public func checkCameraPermission(completionStatus: @escaping (VideoPermissionStatus) -> ()) {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            
            self.askCameraPermission { (granted) in
                if granted {
                    completionStatus(.granted)
                } else {
                    completionStatus(.denied)
                }
            }
            
        case .restricted:
            completionStatus(.restricted)
        case .denied:
            completionStatus(.denied)
        case .authorized:
            completionStatus(.granted)
        @unknown default:
            completionStatus(.denied)
        }
        
    }
    
    public func askCameraPermission(grantedValue: @escaping (Bool) -> ()) {
        
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            if granted {
                grantedValue(true)
            } else {
                grantedValue(false)
            }
        })
        
    }
    
    public func photoLibraryPermission(grantedValue: @escaping (Bool) -> ()) {
        
        PHPhotoLibrary.requestAuthorization { (status) in

            if status.rawValue == 3 {
                grantedValue(true)
            } else {
                grantedValue(false)
            }
        }
        
    }

}
