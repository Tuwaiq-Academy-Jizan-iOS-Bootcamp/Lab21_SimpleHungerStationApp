//
//  DataTableViewCell.swift
//  NouraLab21
//
//  Created by NoON .. on 10/04/1443 AH.
//

import UIKit

class DataTableViewCell: UITableViewCell {
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
