//
//  Cell.swift
//  lab21
//
//  Created by Ahlam Ahlam on 11/04/1443 AH.
//

import Foundation
import UIKit

class cellViewController: UITableViewCell{
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var deliveryChargeLabel: UILabel!
    @IBOutlet weak var restaurantRatingLable: UILabel!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var typeFoodLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
