//
//  CellViewController.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import Foundation
import UIKit
class CellViewController:UITableViewCell {
//Resturant
    @IBOutlet weak var resturantImageView: UIImageView!
    @IBOutlet weak var resturantLogoImageView: UIImageView!
    @IBOutlet weak var resturantRatingLabel: UILabel!
    @IBOutlet weak var resturantDiscountLabel: UILabel!
    @IBOutlet weak var resturantNameLabel: UILabel!
    @IBOutlet weak var resturantTypeLabel: UILabel!
    @IBOutlet weak var resturantDeliveryTimeLabel: UILabel!
    @IBOutlet weak var resturantDeliveryPriceLabel: UILabel!
    @IBOutlet weak var resturantPromoted: UILabel!
    
    //Menu
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealDescrptionLabel: UILabel!
    @IBOutlet weak var mealCalorisLabel: UILabel!
    @IBOutlet weak var framLabel: UIImageView!
}
