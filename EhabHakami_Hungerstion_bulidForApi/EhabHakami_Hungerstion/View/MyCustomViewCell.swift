//
//  MyCustomViewCell.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 10/04/1443 AH.
//

import Foundation
import UIKit

class MyCustomViewCell:UITableViewCell {
    
    
    @IBOutlet weak var promotedBtn: UIButton!
    
    
    @IBOutlet weak var restaurantBrandImageView: UIImageView!
    
    
    @IBOutlet weak var detilesRestaurantBrandImageView: UIImageView!
    
    var detilesRestaurantBrand = UIImage(named: "")
    ///////////////
    
    
    //done
    @IBOutlet weak var photoFoodsImageView: UIImageView!
    var photoFoods = UIImage(named: "")
    
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
    
    /////////
    
    
    
    ////////
    @IBOutlet weak var starImageView: UIImageView!
    
    @IBOutlet weak var detilesStarImageView: UIImageView!
    
   
    
    
    
    

    @IBOutlet weak var detilesPriceFoodLabel: UILabel!
    var detilesPriceFoodText = ""
    
    
    // This consent string
    @IBOutlet weak var detilesTextMinimumInDetilesCell: UILabel!
    
    
    
    
    
    
    
  ////////
    @IBOutlet weak var detilesPriceDeliveryLabel: UILabel!
    var detilesPriceDeliveryText = ""
    
    //This consent string
    @IBOutlet weak var DetilesDeliveryTextCell: UILabel!
    
    
    @IBOutlet weak var muneImageView: UIImageView!
    
    @IBOutlet weak var nameMaleLabel: UILabel!
    
    
    @IBOutlet weak var discrabtionMilLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var colaresImage: UIImageView!
    
    @IBOutlet weak var valueCaluresLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //sameViewDidLoud
//        let rect = CGRect(x: 0, y: 0, width: 256, height: 256)
//        let roundedRect = UIBezierPath(roundedRect: rect, cornerRadius: 50)
//        let circle = UIBezierPath(ovalIn: rect)
//        let freeform = UIBezierPath()
//
//        freeform.addLine(to: CGPoint(x: 50, y: 50))
//        freeform.addLine(to: CGPoint(x: 50, y: 150))
//        freeform.addLine(to: CGPoint(x: 150, y: 50))
//        freeform.addLine(to: .zero)
////        freeform.addLine(to: deliveryOffersLabel.
        
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    
    
}


