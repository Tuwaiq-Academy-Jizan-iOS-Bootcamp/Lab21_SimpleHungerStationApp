//
//  TableViewCell.swift
//  AMAL JELI_LAB21
//
//  Created by Amal Jeli on 10/04/1443 AH.
//

import UIKit


class TableViewCell: UITableViewCell {
    
//    resturant
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var nameResturantLabel: UILabel!
    
    @IBOutlet weak var classificationFoodLabel: UILabel!
    
    @IBOutlet weak var processingTimeLabel: UILabel!
    
    @IBOutlet weak var foodDeliveryLabel: UILabel!
    
    @IBOutlet weak var liveTracking: UILabel!
    
    @IBOutlet weak var restaurantEvaluation: UILabel!
    
    @IBOutlet weak var logoo: UIImageView!
    
    @IBOutlet weak var offerLabel: UILabel!
    
    @IBOutlet weak var promotedLabel: UILabel!
    
    @IBOutlet weak var viewOffer: UIView!
    
    
    
    
    
    
    
    
    
//    var hungerstion:Food?
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    
    
}

