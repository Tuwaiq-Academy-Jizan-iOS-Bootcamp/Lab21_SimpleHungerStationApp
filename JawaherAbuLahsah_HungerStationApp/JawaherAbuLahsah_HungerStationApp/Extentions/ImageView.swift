//
//  ImageView.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 08/05/1443 AH.
//

import Foundation
import UIKit
let imageCache = NSCache<NSString,UIImage>()
extension UIImageView {
    func loadImage(_ urlImage:String) {
        if let imageCache = imageCache.object(forKey: urlImage as NSString) {
            self.image = imageCache
        } else {
            if let url = URL(string: urlImage) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url){
                        DispatchQueue.main.async {
                            if let downloadedImage = UIImage(data: data) {
                                imageCache.setObject(downloadedImage, forKey: urlImage as NSString)
                                self.image = downloadedImage
                            }
                        }
                    }
                }
            }
        }
    }
}
