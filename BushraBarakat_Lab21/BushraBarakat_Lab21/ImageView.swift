//
//  ImageView.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 10/05/1443 AH.
//

import Foundation
import UIKit
let imageCache = NSCache<NSString,UIImage>()
extension UIImageView {
    func loadImageUsingCache(with urlString:String) {
        // 2 see if we have it in the cache
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
        } else {
            if let url = URL(string: urlString) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            if let downloadedImage = UIImage(data: data) {
                                // 3 add image to cache
                                imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                                self.image = downloadedImage
                                
                            }
                        }
                    }
                }
            }
        }
    }
}
