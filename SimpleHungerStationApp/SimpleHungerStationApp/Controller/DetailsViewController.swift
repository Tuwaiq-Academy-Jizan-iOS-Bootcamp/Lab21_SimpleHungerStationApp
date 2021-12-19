//
//  DetailsViewController.swift
//  SimpleHungerStationApp
//
//  Created by Afrah Omar on 11/04/1443 AH.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController {
    
    @IBOutlet weak var muneLogo: UIImageView!
    @IBOutlet weak var muneImage: UIImageView!
    @IBOutlet weak var tabelViewDetails: UITableView!
    @IBOutlet weak var nameMuneLabel: UILabel!
    @IBOutlet weak var offersImage: UIImageView!
    @IBOutlet weak var offersMuneLabel: UILabel!
    @IBOutlet weak var muneTypeLabel: UILabel!
    @IBOutlet weak var muneTimeLabel: UILabel!
    @IBOutlet weak var muneRatingLabel:  UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var muneDeliveryLabel: UILabel!
    @IBOutlet weak var munepriceLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    var id = 0
    var selectRestaurant : RestorantsData?
    var munes = [MenusData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelViewDetails.delegate = self
        tabelViewDetails.dataSource = self
        headerView.layer.shadowColor = UIColor.gray.cgColor
        headerView.layer.shadowOpacity = 1
        headerView.layer.shadowOffset = .zero
        headerView.layer.cornerRadius = 10
        headerView.layer.shadowPath = UIBezierPath(rect: headerView.bounds).cgPath
        headerView.layer.shouldRasterize = true
        self.headerView.layer.cornerRadius = 10
        self.offersMuneLabel.layer.cornerRadius = 10
        muneLogo.image = nil
        muneImage.image = nil
        if let selectRestaurant = selectRestaurant {
            nameMuneLabel.text = selectRestaurant.name
            muneTypeLabel.text = selectRestaurant.category
            muneRatingLabel.text = "\(selectRestaurant.rating)"
            muneTimeLabel.text = "\(selectRestaurant.delivery.time.min)-\(selectRestaurant.delivery.time.max)minutes"
            muneDeliveryLabel.text = "\(20)SR "
            minimumLabel.text = "\(10)SR "
            muneLogo.image = nil
            if let imageL = URL(string: selectRestaurant.image){
                DispatchQueue.global().async {
                    let data0 = try? Data(contentsOf: imageL)
                    if let data = data0 {
                        let imge2 = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.muneLogo.image = imge2
                        }
                    }
                }
            }
            muneImage.image = nil
            if let imageL = URL(string: selectRestaurant.resturant_image){
                DispatchQueue.global().async {
                    let data0 = try? Data(contentsOf: imageL)
                    if let data = data0 {
                        let imge6 = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.muneImage.image = imge6
                        }
                    }
                }
            }
            if selectRestaurant.offer != nil {
                let value = selectRestaurant.offer?.value
                let spend = selectRestaurant.offer?.spend
                offersMuneLabel.text = value! + "\(spend!)"
            }else {
                offersMuneLabel?.removeFromSuperview()
                offersImage.isHidden = true
                
            }
            tabelViewDetails.reloadData()
            id = selectRestaurant.id
            downloadRestorantData()
        }
    }
    func downloadRestorantData() {
        if let UrlRestorantData = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)"){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: UrlRestorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let restorantsInfo = try decorder.decode(Menus.self, from: restorantData)
                            print(restorantsInfo.menu)
                            self.munes = restorantsInfo.menu
                            DispatchQueue.main.async {
                                self.tabelViewDetails.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
// Extension Delegate and Data Source
extension DetailsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return munes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelViewDetails.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! MuneCell
        cell.nameMealLabel.text = munes[indexPath.row].title
        cell.priceMealLabel.text = "\(munes[indexPath.row].price.value) SR"
        if munes[indexPath.row].calories != nil {
            cell.caloriesLabel.text = "\(munes[indexPath.row].calories!) Kcal "
        }else{
            cell.caloriesLabel.isHidden = true
            cell.imageCalories.isHidden = true
        }
        //          subtitle
        if let subtitle = munes[indexPath.row].subtitle {
            cell.subTitleLabel.text = "\(subtitle)"
        }else {
            cell.subTitleLabel.isHidden = true
        }
        if let imageView = URL(string: munes [indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageView)
                if let data = data {
                    let imge3 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil {
                            cell.imageCell.image = imge3
                        }
                    }
                }
            }
        }
        if let imageView = URL(string: munes [indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageView)
                if let data = data {
                    let imge5 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil {
                            cell.imageCell.image = imge5
                        }
                    }
                }
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
