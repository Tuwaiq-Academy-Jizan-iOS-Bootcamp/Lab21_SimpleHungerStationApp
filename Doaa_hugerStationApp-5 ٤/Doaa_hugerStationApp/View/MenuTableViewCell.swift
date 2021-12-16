//
//  MenuTableViewCell.swift
//  Doaa_hugerStationApp
//
//  Created by Dua'a ageel on 11/04/1443 AH.



import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var currencylbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!
    @IBOutlet weak var tietle: UILabel!
    @IBOutlet weak var imge: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
