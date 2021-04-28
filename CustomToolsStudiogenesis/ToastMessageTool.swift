//
//  ToastMessageTool.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

public class ToastMessage {
    
    public enum PositionType: String {
        case top
        case center
        case bottom
    }
    
    public init() {
    }
    
    public func toast(message: String, timeStamp: Double, timeTransition: Double = 0.2, backgroundColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.95), borderColor: UIColor = #colorLiteral(red: 0.1604149618, green: 0.1736847846, blue: 0.192962541, alpha: 1), textColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), textAlignment: NSTextAlignment = .left, customImage: UIImage? = nil, position: PositionType = .center, fontSize: CGFloat = 14, fontWeight: UIFont.Weight = .regular, borderWidth: CGFloat = 3, cornerRadius: CGFloat = 6, constraintConstant: CGFloat = 30, marginWidth: CGFloat = 32) {
        
        // Parameters
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        let window = keyWindow
        let windowWidth = window?.bounds.width ?? 0
        let marginWidth: CGFloat = marginWidth
        let stackViewSpacing: CGFloat = 16.0
        
        // View Container
        let viewContainer = UIView()
        viewContainer.layer.cornerRadius = cornerRadius
        viewContainer.clipsToBounds = true
        viewContainer.layer.borderWidth = borderWidth
        viewContainer.layer.borderColor = borderColor.cgColor
        viewContainer.backgroundColor = backgroundColor
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        // Stack View
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.fillProportionally
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = stackViewSpacing
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Image
        let imageIcon = UIImageView()
        imageIcon.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        imageIcon.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        imageIcon.clipsToBounds = true
        imageIcon.contentMode = .scaleAspectFit
        if customImage != nil {
            imageIcon.image = customImage
        } else {
            imageIcon.isHidden = true
        }
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        
        // Label
        let textLabel = UILabel()
        textLabel.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        textLabel.text = message
        textLabel.textAlignment = textAlignment
        textLabel.numberOfLines = 0
        textLabel.textColor = textColor
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add items to stackView
        stackView.addArrangedSubview(imageIcon)
        stackView.addArrangedSubview(textLabel)
        
        // Add items to viewContainner
        viewContainer.addSubview(stackView)
        
        // Add item to screen
        viewContainer.alpha = 0.0
        window?.addSubview(viewContainer)
        window?.bringSubviewToFront(viewContainer)
        
        // Add constraints
        switch position {
        case .top: // top
            viewContainer.topAnchor.constraint(equalTo: window!.topAnchor, constant: constraintConstant).isActive = true
            viewContainer.bottomAnchor.constraint(lessThanOrEqualTo: window!.bottomAnchor, constant: (constraintConstant * -1)).isActive = true
            break
        case .bottom: // bottom
            viewContainer.topAnchor.constraint(greaterThanOrEqualTo: window!.topAnchor, constant: constraintConstant).isActive = true
            viewContainer.bottomAnchor.constraint(equalTo: window!.bottomAnchor, constant: (constraintConstant * -1)).isActive = true
            break
        case .center: // center
            viewContainer.topAnchor.constraint(greaterThanOrEqualTo: window!.topAnchor, constant: constraintConstant).isActive = true
            viewContainer.bottomAnchor.constraint(lessThanOrEqualTo: window!.bottomAnchor, constant: constraintConstant).isActive = true
            viewContainer.centerYAnchor.constraint(equalTo: window!.centerYAnchor).isActive = true
            break
        }
        
        viewContainer.widthAnchor.constraint(equalToConstant: windowWidth - marginWidth).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: window!.centerXAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -20).isActive = true
        
        // Create animation
        UIView.animate(withDuration: timeTransition, animations: {
            viewContainer.alpha = 1.0
        }, completion: {
            (finished: Bool) -> Void in
            
            UIView.animate(withDuration: timeTransition, delay: timeStamp, animations: {
                viewContainer.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                viewContainer.removeFromSuperview()
            })
        })
        
    }
}


