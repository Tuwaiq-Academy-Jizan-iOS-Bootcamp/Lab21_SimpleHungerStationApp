//
//  ResturantTable.swift
//  HungerCaptson
//
//  Created by Yasir Hakami on 09/12/2021.
//

import Foundation
import UIKit

class TableViewCellForResturnt:UITableViewCell{
    @IBOutlet weak var resturntImage: UIImageView!
    @IBOutlet weak var resturnLogo: UIImageView!
    @IBOutlet weak var promtoed: UIButton!
    
    @IBOutlet weak var offer: UILabel!
    @IBOutlet weak var resturntName: UILabel!
    
    @IBOutlet weak var foodTaype: UILabel!
    @IBOutlet weak var delviryTime: UILabel!
    
    @IBOutlet weak var delviryCost: UILabel!
    @IBOutlet weak var liveTracking: UILabel!
    @IBOutlet weak var eveloutionStar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            // label shabe
        offer?.sizeToFit()
    let path = UIBezierPath()
        path.move(to: .zero)
    path.addLine(to: CGPoint(x: offer?.bounds.width ??  +50, y: 0))
    path.addLine(to: CGPoint(x: offer?.bounds.width ?? +0 , y: 0))


                    path.addLine(to: CGPoint(x: 0, y: 150))

                    let shape = CAShapeLayer()
                    shape.path = path.cgPath

        offer?.layer.mask = shape
    }
}
