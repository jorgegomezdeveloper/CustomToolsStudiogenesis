//
//  GestureRecognizerTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

// hide keyboard when user touches outside keyboard
extension UIViewController {
    
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        print("\n\t# dismissKeyboard #\n")
        view.endEditing(true)
    }
}

public class GestureRecognizerTools {
    
    public init() {
        
    }
    
    // set tap gesture recognizer for images
    public func setTapGestureRecognizer(object: UIImageView, target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tapGesture)
    }
    
    // set tap gesture recognizer for labels
    public func setTapGestureRecognizer(object: UILabel, target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tapGesture)
    }
    
    // set tap gesture recognizer for view
    public func setTapGestureRecognizer(object: UIView, target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tapGesture)
    }
    
    // set tap gesture recognizer for textView
    public func setTapGestureRecognizer(object: UITextView, target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tapGesture)
    }
    
    // set tap gesture recognizer for button
    public func setTapGestureRecognizer(object: UIButton, target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tapGesture)
    }
    
    // set tap gesture recognizer for button
    public func setTapGestureRecognizer(object: UITextField, target: Any?, action: Selector?) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        object.isUserInteractionEnabled = true
        object.addGestureRecognizer(tapGesture)
    }
    
}




