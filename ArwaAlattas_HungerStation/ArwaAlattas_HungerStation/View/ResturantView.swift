//
//  ResturantView.swift
//  ArwaAlattas_HungerStation
//
//  Created by Arwa Alattas on 08/05/1443 AH.
//

import Foundation
import UIKit
class ResturantView :UITableViewCell{
    
    
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantLogo: UIImageView!
    @IBOutlet weak var promotedLabel: UILabel!
    
    @IBOutlet weak var viewOfOffer: UIView!
    @IBOutlet weak var offerLabel: UILabel!
    
    @IBOutlet weak var nameOfResturant: UILabel!
    @IBOutlet weak var typeOfResturant: UILabel!
    @IBOutlet weak var delevery: UILabel!
    @IBOutlet weak var tracking: UILabel!
    @IBOutlet weak var rating: UILabel!
    override func prepareForReuse() {
        resturantImage.image = nil
        resturantLogo.image = nil
    }
}
