//
//  CornerTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

extension UIView {

    public func roundSpecificsCorners(corners: UIRectCorner, radius: CGFloat, clipsToBoundsValue: Bool = true) {
        if #available(iOS 11.0, *) {
            clipsToBounds = clipsToBoundsValue
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }

    public func setRoundView() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
