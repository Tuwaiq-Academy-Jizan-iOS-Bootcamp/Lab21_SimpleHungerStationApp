//
//  MenuTableViewCell.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 12/04/1443 AH.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var backgraundRestruant: UIImageView!
    @IBOutlet weak var overSAR: UILabel!
    @IBOutlet weak var nameMealMenu: UILabel!
    @IBOutlet weak var imageMealMenu: UIImageView!
    @IBOutlet weak var sarMealMenu: UILabel!
    var imageMenuA = UIImage(named: "")
   var nameMeal = ""
    var sarMenu = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        nameMealMenu.text = nameMeal
        sarMealMenu.text = sarMenu
        imageMealMenu.image = imageMenuA
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
