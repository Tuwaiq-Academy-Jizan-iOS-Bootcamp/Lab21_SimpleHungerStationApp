//
//  Menu.swift
//  hungarStationAPI
//
//  Created by Ahlam Ahlam on 08/05/1443 AH.
//

import UIKit

let imageCache = NSCache<NSString,UIImage>()
extension UIImageView {
    func loadImageUsingCache(with urlString:String) {

        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
        } else {
            if let url = URL(string: urlString) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            if let downloadedImage = UIImage(data: data) {
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
