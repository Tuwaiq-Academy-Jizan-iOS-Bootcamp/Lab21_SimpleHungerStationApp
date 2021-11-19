//
//  DataTVCell.swift
//  FatanAbdullahLab21
//
//  Created by Faten Abdullh salem on 11/04/1443 AH.
//

import UIKit

class DataTVCell: UITableViewCell {
    
@IBOutlet weak var ImageHungerStion: UIImageView!
@IBOutlet weak var theOffer: UILabel!
@IBOutlet weak var RestauranName: UILabel!
@IBOutlet weak var MealType: UILabel!
@IBOutlet weak var Evaluation: UILabel!
@IBOutlet weak var DeliveryTime: UILabel!
@IBOutlet weak var DeliveryPrice: UILabel!
@IBOutlet weak var LogOne: UIImageView!
    
    @IBOutlet weak var MealName: UILabel!
    @IBOutlet weak var PriceMeal: UILabel!
    @IBOutlet weak var imageMeal: UIImageView!
override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
