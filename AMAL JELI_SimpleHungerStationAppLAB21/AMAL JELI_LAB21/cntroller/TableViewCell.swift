//
//  TableViewCell.swift
//  AMAL JELI_LAB21
//
//  Created by Amal Jeli on 10/04/1443 AH.
//

import UIKit
struct Food {
    var imageFood1:UIImage
    var nameResturantLable1:String
    var classificationFoodLabel1:String
    var processingTimeLabel1:String
    var foodDelivery1:String
    var liveTrackingLabel1:String
    var restaurantEvaluation1:String
    
}

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var nameResturantLabel: UILabel!
    
    @IBOutlet weak var classificationFoodLabel: UILabel!
    
    @IBOutlet weak var processingTimeLabel: UILabel!
    
    @IBOutlet weak var foodDeliveryLabel: UILabel!
    
    @IBOutlet weak var liveTracking: UILabel!
    
    @IBOutlet weak var restaurantEvaluation: UILabel!
    
    
    
    var hungerstion:Food?
    override func awakeFromNib() {
        super.awakeFromNib()
    
        imageFood.image = hungerstion?.imageFood1
        nameResturantLabel.text = hungerstion?.nameResturantLable1
        classificationFoodLabel.text = hungerstion?.classificationFoodLabel1
        processingTimeLabel.text = hungerstion?.processingTimeLabel1
        foodDeliveryLabel.text = hungerstion?.foodDelivery1
        liveTracking.text = hungerstion?.liveTrackingLabel1
        restaurantEvaluation.text = hungerstion?.restaurantEvaluation1
    }
        
        func element (imageFood0:UIImage , nameResturantLabel0:String , classificationFoodLabel0:String ,processingTimeLabel0:String , foodDeliveryLabel0:String ,liveTracking0:String , restaurantEvaluation0 : String) {
        
            imageFood.image = imageFood0
            nameResturantLabel.text = nameResturantLabel0
            classificationFoodLabel.text = classificationFoodLabel0
            processingTimeLabel.text = processingTimeLabel0
            foodDeliveryLabel.text = foodDeliveryLabel0
            liveTracking.text = liveTracking0
            restaurantEvaluation.text = restaurantEvaluation0
        
        
    
    
    
}
}

