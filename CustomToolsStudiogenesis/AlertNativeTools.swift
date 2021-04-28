//
//  AlertNativeTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

extension UIViewController {
    
    enum UIAlertActionOptions {
        case `default`
        case destructive
    }
    
    func showBasicAlert(title: String,
                        message: String,
                        buttonText: String,
                        alertStyle: UIAlertController.Style = .alert,
                        buttonStyle: UIAlertAction.Style = .default,
                        completion: @escaping (Bool) -> ()) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
            
            let buttonAction = UIAlertAction(title: buttonText, style: buttonStyle) {
                UIAlertAction in
                
                completion(true)
            }
            alert.addAction(buttonAction)
            
            self.present(alert, animated: true)
        }
    }
    
    
    func showAlertTwoOptions(title: String,
                             message: String,
                             buttonOneText: String,
                             buttonTwoText: String,
                             alertStyle: UIAlertController.Style = .alert,
                             buttonStyle: UIAlertActionOptions = .default,
                             completion: @escaping (Bool) -> ()) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
            var buttonStyleValue: UIAlertAction.Style = .default
            
            if buttonStyle == .destructive {
                buttonStyleValue = .destructive
            }
            
            let buttonActionOne = UIAlertAction(title: buttonOneText, style: buttonStyleValue) {
                UIAlertAction in
                completion(true)
            }
            alert.addAction(buttonActionOne)
            
            let buttonActionTwo = UIAlertAction(title: buttonTwoText, style: buttonStyleValue) {
                UIAlertAction in
                completion(false)
            }
            alert.addAction(buttonActionTwo)
            
            self.present(alert, animated: true)
        }
    }
    
}



