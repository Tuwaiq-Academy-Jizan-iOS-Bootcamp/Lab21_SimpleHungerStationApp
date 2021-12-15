//
//  MuneTableViewCell.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 11/12/2021.
//

import Foundation
import UIKit
class MuneTableViewCell:UITableViewCell {
    
    
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuDiscriptionLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var caloresLabel: UILabel!
    @IBOutlet weak var cloresImage: UIImageView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = 7
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 10
        layer.shadowPath = CGPath(rect: .init(x: 0,
                                          y: 10,
                                          width: contentView.bounds.width,
                                          height: contentView.bounds.height - 20),
                              transform: nil)    }
}
