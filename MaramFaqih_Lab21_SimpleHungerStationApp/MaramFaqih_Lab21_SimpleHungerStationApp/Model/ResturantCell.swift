//
//  ResturantCell.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//

import UIKit
class ResturntCell : UITableViewCell{
    
    @IBOutlet weak var viewOffer: UIView!
    @IBOutlet weak var nameCell: UILabel!
   // @IBOutlet weak var maxDeliveryTimeCell: UILabel!
    
    @IBOutlet weak var currencyCell: UILabel!
    @IBOutlet weak var deliveryTimeCell: UILabel!
  //  @IBOutlet weak var offerSpendCell: UILabel!
    @IBOutlet weak var ratingCell: UILabel!
    @IBOutlet weak var cuisineCell: UILabel!
    @IBOutlet weak var logoCell: UIImageView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var offerCell: UILabel!
    @IBOutlet weak var isPromotedCell : UILabel!
 
    @IBOutlet weak var deliveryPriceCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        logoCell.layer.cornerRadius = 0.2 *  logoCell.bounds.size.height

        logoCell.layer.masksToBounds = true
    }
    //nameCell.text = resturants[indexPath.row].name
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
