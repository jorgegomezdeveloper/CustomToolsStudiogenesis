//
//  BorderTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

extension UIView {

    public func setBorderLikeTextField() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 0.9
        self.layer.borderColor = #colorLiteral(red: 0.8235294118, green: 0.8235294118, blue: 0.8235294118, alpha: 1)
    }

}
