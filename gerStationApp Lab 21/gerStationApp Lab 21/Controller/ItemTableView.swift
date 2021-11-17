//
//  ItemTableViewOne.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 11/04/1443 AH.
//

import Foundation
import UIKit
class ItemTableView: UITableViewCell{
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var typeFoods: UILabel!
    @IBOutlet weak var timeDelivery: UILabel!
    @IBOutlet weak var liveTracking: UILabel!
    @IBOutlet weak var evaluationNamber: UILabel!
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var purchaceValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

