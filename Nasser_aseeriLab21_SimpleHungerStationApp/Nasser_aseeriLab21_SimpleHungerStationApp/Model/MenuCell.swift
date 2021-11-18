//
//  MenuCell.swift
//  Nasser_aseeriLab21_SimpleHungerStationApp
//
//  Created by Nasser Aseeri on 12/04/1443 AH.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var mealNameCell: UILabel!
    @IBOutlet weak var priceMealCell: UILabel!
    @IBOutlet weak var imageMenuCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
