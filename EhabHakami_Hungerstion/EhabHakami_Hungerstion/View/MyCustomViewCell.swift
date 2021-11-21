//
//  MyCustomViewCell.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 10/04/1443 AH.
//

import Foundation
import UIKit

class MyCustomViewCell:UITableViewCell {
    
    @IBOutlet weak var promotedLabel: UILabel!
    var promotedLabelText = ""
    
    
    //////////////////done
    @IBOutlet weak var restaurantBrandImageView: UIImageView!
    var restaurantBrand = UIImage(named: "macChiken2")
    
    @IBOutlet weak var detilesRestaurantBrandImageView: UIImageView!
    
    var detilesRestaurantBrand = UIImage(named: "macChiken2")
    ///////////////
    
    
    //done
    @IBOutlet weak var photoFoodsImageView: UIImageView!
    var photoFoods = UIImage(named: "macChiken2")
    
    //done
    @IBOutlet weak var deliveryOffersLabel: UILabel!
    var deliveryOffersText = ""
    
    
    ///////////done
    @IBOutlet weak var nameRestaurantLabel: UILabel!
    var nameRestaurantText = ""
    
    @IBOutlet weak var detilesNameRestaurantLabel: UILabel!
//    var detilesNameRestaurantText = ""
    ///////////////
    
    
    
    ///////////////done
    @IBOutlet weak var typeOfFoodLabel: UILabel!
    var typeOfFoodText = ""
    @IBOutlet weak var detilesTypeOfFoodLabel: UILabel!
    var detilesTypeOfFoodText = ""
    
   ///////////////
    
    
   /////////////////
    @IBOutlet weak var estimatedTimeOfArrivalLabel: UILabel!
    var estimatedTimeOfArrivalText = ""
    @IBOutlet weak var detilesEstimatedTimeOfArrivalLabel: UILabel!
    var detilesEstimatedTimeOfArrivaText = ""
    
    @IBOutlet weak var detilesDeliveryTimeTextIncelltwo: UILabel!
    var detilesDeliveryTimeTextIncelltwoText = ""
    ////////////////////
    
    
    
    //no need detiles
    @IBOutlet weak var clockImageView: UIImageView!
    
    
    //no need detiles
    @IBOutlet weak var liveTrackLabel: UILabel!
    
    
    
    
    ////////
    @IBOutlet weak var rateTheFoodLabel: UILabel!
    var rateTheFood = ""
    @IBOutlet weak var detilesRateTheFoodLabel: UILabel!
    var detilesRateTheFood = ""
    /////////
    
    
    
    ////////
    @IBOutlet weak var starImageView: UIImageView!
    var starImage = UIImage(systemName: "star.fill")!
    @IBOutlet weak var detilesStarImageView: UIImageView!
    var detilesStarImage = UIImage(systemName: "star.fill")!
    ///////////
    
    
    
    /////////

    @IBOutlet weak var detilesPriceFoodLabel: UILabel!
    var detilesPriceFoodText = ""
    
    
    // This consent string
    @IBOutlet weak var detilesTextMinimumInDetilesCell: UILabel!
    
    
    //////////
    
    
    
    
  ////////
    @IBOutlet weak var detilesPriceDeliveryLabel: UILabel!
    var detilesPriceDeliveryText = ""
    
    //This consent string
    @IBOutlet weak var DetilesDeliveryTextCell: UILabel!
    
    ///////////

    
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        //sameViewDidLoud
        
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    override func awakeFromNib() {
        
        
//        restaurantBrandImageView.image = restaurantBrand
        //detilesRestaurantBrandImageView.image = detilesRestaurantBrand
        
        
//        photoFoodsImageView.image = photoFoods
//
//        deliveryOffersLabel.text = deliveryOffersText
//
//        nameRestaurantLabel.text = nameRestaurantText
//        detilesNameRestaurantLabel.text = detilesNameRestaurantText
//
//        typeOfFoodLabel.text = typeOfFoodText
//        detilesTypeOfFoodLabel.text = detilesTypeOfFoodText
//
//        estimatedTimeOfArrivalLabel.text = estimatedTimeOfArrivalText
//        detilesEstimatedTimeOfArrivalLabel.text = detilesEstimatedTimeOfArrivaText
//
//        rateTheFoodLabel.text = rateTheFood
//        detilesRateTheFoodLabel.text = detilesRateTheFood
//
//        starImageView.image = starImage
//        detilesStarImageView.image = detilesStarImage
//
//        detilesPriceFoodLabel.text = detilesPriceFoodText
//
//
//        detilesPriceDeliveryLabel.text = detilesPriceDeliveryText
        
        
        
        
//        DetilesDeliveryTextCell.text = "Delivery"
//        detilesDeliveryTimeTextIncelltwo.text = "Delivery Time"
//        detilesTextMinimumInDetilesCell.text = "Minimum"
        
        
        
    }
    
}


