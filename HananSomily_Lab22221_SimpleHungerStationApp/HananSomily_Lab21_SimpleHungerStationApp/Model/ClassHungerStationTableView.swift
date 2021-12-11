//
//  ClassHungerStationTableView.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//

import Foundation
import UIKit

class ClassHungerStationTableView:UITableViewCell {
 
//
    //@IBOutlet weak var logoCanteen: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var nameMealLabel: UILabel!
    @IBOutlet weak var descriptionMealLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var deliverCostLabel: UILabel!
    @IBOutlet weak var liveTrackingLabel: UILabel!
    @IBOutlet weak var evaluationLabel: UILabel!
    
    @IBOutlet weak var offerLabel: UILabel!
    
    @IBOutlet weak var promotedLable: UILabel!
    
var foods:DataAPI?
override func awakeFromNib() {
    super.awakeFromNib()
//    logoImage.image = foods?.image
   // imageMeal.image = foods?.resturant_image
    nameMealLabel.text = foods?.name
    descriptionMealLabel.text = foods?.category
    deliverCostLabel.text = "\(foods?.delivery.cost.value)\(foods?.delivery.cost.currency)"
    deliveryTimeLabel.text = "\(foods?.delivery.time.max) - \(foods?.delivery.time.min)"
//   // liveTrackingLabel.text = foods.
//    evaluationLabel.text = foods?.evalution
    offerLabel.text = "\(foods?.offer?.value)(Spend \(foods?.offer?.spend)SAR)"
    promotedLable.text = "\(foods?.is_promoted)"

}
   
}
