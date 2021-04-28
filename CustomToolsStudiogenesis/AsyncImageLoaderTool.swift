//
//  AsyncImageLoaderTool.swift
//  CustomToolsStudiogenesis
//
//  Created by Jorge GA-studiogenesis on 28/04/2021.
//  Copyright © 2021 Jorge GA-studiogenesis. All rights reserved.
//

import SwiftUI

public let imageCache = NSCache<NSString, UIImage>()

public class AsyncImageLoaderTool: UIImageView {

    var imageNotFoundName = ""
    var imageUrlString: String?

    public func loadImageUrlString(urlString: String?, nameImageNotFound: String) {

        self.alpha = 1
        imageNotFoundName = nameImageNotFound

        if urlString == nil || urlString == "" || urlString == " " {

            self.image = UIImage(named: imageNotFoundName)

        } else {

            imageUrlString = urlString
            image = nil

            if let imageFromCache = imageCache.object(forKey: urlString! as NSString) {
                self.image = imageFromCache
                return
            }

            URLSession.shared.dataTask(with: URL(string: urlString!)!, completionHandler: { (data, response, error) -> Void in

                if error != nil {
                    DispatchQueue.main.async {
                        print(error as Any)
                        self.image = UIImage(named: self.imageNotFoundName)
                    }
                    return
                }

                DispatchQueue.main.async {

                    if let imageToCache = UIImage(data: data!) {
                        if self.imageUrlString == urlString {
                            self.image = imageToCache
                        }

                        imageCache.setObject(imageToCache, forKey: urlString! as NSString)
                        self.image = imageToCache
                    } else {
                        self.alpha = 0
                    }

                }
            }).resume()
        }
    }

}






