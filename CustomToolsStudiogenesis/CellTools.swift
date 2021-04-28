//
//  CellTools.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI
import UIKit

public class CellTools {
    
    public init() {
        
    }
    
    public func changeBackgroundColorBetweenCells(view: UIView, indexPath: IndexPath, cellColorOne: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), cellColorTwo: UIColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)) {
        
        if indexPath.row%2 == 0 {
            view.backgroundColor = cellColorOne
        } else {
            view.backgroundColor = cellColorTwo
        }
    }
    
    public func setCellCornerRadius(cell: UIView, indexPath: IndexPath, viewSeparator: UIView?, cornerRadius: CGFloat, dataCount: Int) {
    
        if indexPath.row == 0 {
            cell.roundSpecificsCorners(corners: [.topLeft, .topRight], radius: cornerRadius)
            viewSeparator?.isHidden = false
        } else if indexPath.row == dataCount-1 {
            cell.roundSpecificsCorners(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            viewSeparator?.isHidden = true
        } else {
            cell.roundSpecificsCorners(corners: [.bottomLeft, .bottomRight], radius: 0)
            viewSeparator?.isHidden = false
        }
        
        if dataCount == 1 {
            cell.roundSpecificsCorners(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
            viewSeparator?.isHidden = true
        }
    }
    
}

extension UIView {
    
    func round(corners: UIRectCorner, cornerRadius: Double) {
        
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
}

