//
//  ShareTool.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

public class ShareTool {

    public init() {

    }

    public func shareApp(textToShare: String, viewController: UIViewController) {

        let activityViewController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = viewController.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        // activityViewController.excludedActivityTypes = [ UIActivityType.airDrop ]

        // present the view controller
        viewController.present(activityViewController, animated: true, completion: nil)
    }

}
