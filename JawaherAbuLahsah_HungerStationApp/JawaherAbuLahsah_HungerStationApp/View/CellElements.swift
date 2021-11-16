//
//  CellElements.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/04/1443 AH.
//

import Foundation
import UIKit
class CellElements:UITableViewCell{
//this is from the restaurant view controller
    @IBOutlet weak var restaurantLogoImageView: UIImageView!
    @IBOutlet weak var restaurantDisplayImageView: UIImageView!
    @IBOutlet weak var restaurantOffersLabel: UILabel!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var restaurantRatingLabel: UILabel!
//this is from the menu for restaurant
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealImageLabel: UIImageView!
    
}
