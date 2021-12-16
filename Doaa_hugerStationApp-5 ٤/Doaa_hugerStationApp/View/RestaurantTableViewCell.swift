//
//  RestaurantTableViewCell.swift
//  Doaa_hugerStationApp
//
//  Created by Dua'a ageel on 11/04/1443 AH.



import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var imgresturant: UIImageView!
    
    @IBOutlet weak var viewOffer: UIView!
    @IBOutlet weak var lblrating: UILabel!
    @IBOutlet weak var currencylbl: UILabel!
    @IBOutlet weak var costlbl: UILabel!
    @IBOutlet weak var viewdelivery: UIView!
    @IBOutlet weak var maxlbl: UILabel!
    @IBOutlet weak var minlbl: UILabel!
    @IBOutlet weak var categorylbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var spendlbl: UILabel!
    @IBOutlet weak var valuelbl: UILabel!
    @IBOutlet weak var viewPrometed: UIView!
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
