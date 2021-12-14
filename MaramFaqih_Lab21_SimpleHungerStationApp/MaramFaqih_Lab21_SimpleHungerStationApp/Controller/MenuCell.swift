//
//  MenuCell.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 11/04/1443 AH.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mealNameCell: UILabel!
    @IBOutlet weak var priceMealCell: UILabel!
    @IBOutlet weak var imageMenuCell: UIImageView!
    @IBOutlet weak var caloriesImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
