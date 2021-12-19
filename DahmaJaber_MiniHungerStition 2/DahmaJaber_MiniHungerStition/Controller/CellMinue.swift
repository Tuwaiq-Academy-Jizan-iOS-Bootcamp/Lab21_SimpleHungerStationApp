//
//  CellMinue.swift
//  DahmaJaber_MiniHungerStition
//
//  Created by dahma alwani on 14/04/1443 AH.
//

import Foundation
import UIKit

class CellMinue : UITableViewCell {
    
    override class func awakeFromNib() {
        
    }
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var discribtionLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var caloriesUIImageView: UIImageView!
    
    @IBOutlet weak var imageMeal: UIImageView!
}
