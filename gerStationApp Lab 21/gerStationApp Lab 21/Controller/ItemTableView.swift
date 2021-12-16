//
//  ItemTableViewOne.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 11/04/1443 AH.
//

import Foundation
import UIKit
class ItemTableView: UITableViewCell{
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var delivery: UILabel!
    @IBOutlet weak var permted: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var offerView: UIView!
    //    menu
    @IBOutlet weak var menuImg: UIImageView!
    @IBOutlet weak var nameMenu: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var decsription: UILabel!
    @IBOutlet weak var category1: UILabel!
    @IBOutlet weak var caloriesImage: UIImageView!
    
    override func prepareForReuse() {
//        restaurantImage.image = nil
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

