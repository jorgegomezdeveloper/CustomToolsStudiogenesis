//
//  ShadowTools.swift
//  CustomToolsDGP
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

extension UIView {

    public func setShadow(offsetWidth: CGFloat = 0, offsetHeight: CGFloat = 10, shadowOpacity: Float = 0.4, shadowRadius: CGFloat = 16, shadowColor: CGColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)) {
        self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor =  shadowColor
    }

    public func setShadowSoft(cornerRadius: CGFloat = 2) {
        self.setShadow(offsetWidth: 0, offsetHeight: 1, shadowOpacity: 0.8, shadowRadius: 1, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        self.layer.cornerRadius = cornerRadius
    }

}
