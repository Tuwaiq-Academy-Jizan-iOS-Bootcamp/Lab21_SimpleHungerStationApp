//
//  MenuView.swift
//  ArwaAlattas_HungerStation
//
//  Created by Arwa Alattas on 09/05/1443 AH.
//

import Foundation
import UIKit
class MenuView:UITableViewCell{
    @IBOutlet weak var MealName: UILabel!
    @IBOutlet weak var mealPrice: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    
    @IBOutlet weak var mealDescription: UILabel!
    @IBOutlet weak var calorieImage: UIImageView!
    @IBOutlet weak var mealCalories: UILabel!
    
    override func prepareForReuse() {
        mealImage.image = nil
    }
 
    
}
