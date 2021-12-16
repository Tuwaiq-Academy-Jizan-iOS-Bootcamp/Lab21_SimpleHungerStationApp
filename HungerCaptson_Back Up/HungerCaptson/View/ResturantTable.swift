//
//  ResturantTable.swift
//  HungerCaptson
//
//  Created by Yasir Hakami on 09/12/2021.
//

import Foundation
import UIKit

class TableViewCellForResturnt:UITableViewCell{
    @IBOutlet weak var resturntImage: UIImageView!
    @IBOutlet weak var resturnLogo: UIImageView!
    @IBOutlet weak var promtoed: UIButton!
    
    @IBOutlet weak var offer: UILabel!
    @IBOutlet weak var resturntName: UILabel!
    
    @IBOutlet weak var foodTaype: UILabel!
    @IBOutlet weak var delviryTime: UILabel!
    
    @IBOutlet weak var delviryCost: UILabel!
    @IBOutlet weak var liveTracking: UILabel!
    @IBOutlet weak var eveloutionStar: UILabel!
}
