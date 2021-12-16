//
//  ViewController.swift
//  HungerSti0n
//
//  Created by يوسف جابر المالكي on 10/05/1443 AH.
//

import UIKit

class RestorantViewController: UIViewController {
    @IBOutlet weak var foodTableView: UITableView!
    
    var restorants: Restorants = Restorants(data: [])
    var idSender = 0
    var minimumCostSender:Double = 0
    var deliveryCostSender:Double = 0
    var deliveryMinTimeSender = 0
    var deliveryMaxTimeSender = 0
    var raitingSender:Float = 0
    var restorantBackImageSender = ""
    var logoSener = ""
    var nameSender = ""
    var contantSender = ""
    var promotedLabelSender = ""
    let restorantsURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
    var restorants1 = [Restorants]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadRestorantData(restorantsURL)
        foodTableView.delegate = self
        foodTableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendToMenu = segue.destination as? MenuViewController
        sendToMenu?.idResiver = idSender
        sendToMenu?.backImageResiver = restorantBackImageSender
        sendToMenu?.logoResiver = logoSener
        sendToMenu?.nameResiver = nameSender
        sendToMenu?.raitingResiver = raitingSender
        sendToMenu?.minimumCostResiver = minimumCostSender
        sendToMenu?.deliveryCostResiver = deliveryCostSender
        sendToMenu?.deliveryMinTimeResiver = deliveryMinTimeSender
        sendToMenu?.deliveryMaxTimeResiver = deliveryMaxTimeSender
        sendToMenu?.promotedLabelResiver = promotedLabelSender
        sendToMenu?.contantResiver = contantSender
    }
    @IBAction func getBack(segue:UIStoryboardSegue) {
    }
    func downloadRestorantData(_ FromURL: String) {
        if let urlData = URL(string: FromURL) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            self.restorants = try decorder.decode(Restorants.self, from: restorantData)
                            DispatchQueue.main.async {
                                self.foodTableView.reloadData()
                            }
                            }catch {
                            print( error.localizedDescription)
                        }
                    }
                }
             }
             urlTask.resume()
        }
    }
}

// 1 define cache
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
