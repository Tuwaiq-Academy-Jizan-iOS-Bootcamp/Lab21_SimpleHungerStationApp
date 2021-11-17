//
//  DetailsViewController.swift
//  SimpleHungerStationApp
//
//  Created by Afrah Omar on 11/04/1443 AH.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController {
    
    @IBOutlet weak var muneRatinglabel: UILabel!
    @IBOutlet weak var muneLogo: UIImageView!
    @IBOutlet weak var tabelViewDetails: UITableView!
    @IBOutlet weak var nameMuneLabel: UILabel!
    @IBOutlet weak var offersMuneLabel: UILabel!
    @IBOutlet weak var muneImage: UIImageView!
    @IBOutlet weak var muneTypeLabel: UILabel!
    @IBOutlet weak var muneTimeLabel: UILabel!
    @IBOutlet weak var deliveryChargeMuneLabel: UILabel!
    
    var selectRestaurant : Restaurant?
    var munes : [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    tabelViewDetails.delegate = self
    tabelViewDetails.dataSource = self
        
        if let selectRestaurant = selectRestaurant {
            nameMuneLabel.text = selectRestaurant.nameResturant
            muneRatinglabel.text = selectRestaurant.resturantRating
            muneLogo.image = UIImage(named :selectRestaurant.resturantLogo)
            offersMuneLabel.text = selectRestaurant.resturantOffers
            muneImage.image = UIImage(named: selectRestaurant.imageResturant)
            muneTypeLabel.text = selectRestaurant.resturantType
            muneTimeLabel.text = selectRestaurant.timeMealPreparation
        }
    
        if nameMuneLabel.text ==  "Herfy" {
            munes = herfyrestaurant
        }
        if nameMuneLabel.text == "Applebee's"{
            munes = appleBessrestaurants
        }
        if nameMuneLabel.text == "Ocean Basket"{
        munes = oceanBasketrestaurants
        }
    }
}
    extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return munes.count
}

     
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TheCell", for: indexPath) as! MuneCell
            
            cell.nameMealLabel.text = munes[indexPath.row].nameMeal
            cell.priceMealLabel.text = munes[indexPath.row].priceMeal
            cell.imageMeal.image =  UIImage(named:munes[indexPath.row].imageMeal)
    
    return cell
}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             return 150
        }

    }

