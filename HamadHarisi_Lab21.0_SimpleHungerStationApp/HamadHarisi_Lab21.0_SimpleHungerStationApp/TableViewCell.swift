//
//  TableViewCell.swift
//  HamadHarisi_Lab21.0_SimpleHungerStationApp
//
//  Created by حمد الحريصي on 15/11/2021.
//
import UIKit

class TableViewCell: UITableViewCell
{
    // for VC1
    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var foodName: UILabel!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var deliveryTime: UILabel!
    @IBOutlet var ratingStars: UILabel!
    
    
    
    //for VC2
    @IBOutlet var foodImageInVC2: UIImageView!
    @IBOutlet var foodNameInVC2: UILabel!
    @IBOutlet var foodCostInVC2: UILabel!
    
}
