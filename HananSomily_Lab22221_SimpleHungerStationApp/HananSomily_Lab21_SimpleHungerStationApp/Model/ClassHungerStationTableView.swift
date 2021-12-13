//
//  ClassHungerStationTableView.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//

import Foundation
import UIKit

class ClassHungerStationTableView:UITableViewCell {
 
//
    @IBOutlet weak var viewDetelCell: UIView!
    {
      didSet{
//          viewDetelCell.layer.masksToBounds = true
//          viewDetelCell.layer.repeatCount = 50
        }
    }
    @IBOutlet weak var offerViewShape: UIView! {
        didSet{
//        let path = UIBezierPath()
//        path.move(to: .zero)
//        path.addLine(to: CGPoint(x: 280, y: 0))
//        path.addLine(to: CGPoint(x: 240, y: 30))
//        path.addLine(to: CGPoint(x: 0, y: 30))
//
//        let shape = CAShapeLayer()
//        shape.path = path.cgPath
//
//        offerViewShape.layer.mask = shape
            //offerViewShape.sizeToFit()
        }
    }
    //@IBOutlet weak var logoCanteen: UIImageView!
    @IBOutlet weak var cellView: UIView! {
        didSet{
        cellView.layer.masksToBounds = true
            cellView.layer.repeatCount = 5
        }
    }
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var nameMealLabel: UILabel!
    @IBOutlet weak var descriptionMealLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var deliverCostLabel: UILabel!
    @IBOutlet weak var liveTrackingLabel: UILabel!
    @IBOutlet weak var evaluationLabel: UILabel!
    
    @IBOutlet weak var offerLabel: UILabel!
    {
        didSet{
//            let path = UIBezierPath()
//            path.move(to: .zero)
//            path.addLine(to: CGPoint(x: 300, y: 0))
//            path.addLine(to: CGPoint(x: 200, y: 25))
//            path.addLine(to: CGPoint(x: 0, y: 25))
//
//            let shape = CAShapeLayer()
//            shape.path = path.cgPath
//
//            offerLabel.layer.mask = shape
    }
   }
    @IBOutlet weak var promotedLable: UILabel!
    
var foods:DataAPI?
override func awakeFromNib() {
    super.awakeFromNib()
//    logoImage.image = foods?.image
   // imageMeal.image = foods?.resturant_image
    nameMealLabel.text = foods?.name
    descriptionMealLabel.text = foods?.category
    deliverCostLabel.text = "\(foods?.delivery.cost.value)\(foods?.delivery.cost.currency)"
    deliveryTimeLabel.text = "\(foods?.delivery.time.max) - \(foods?.delivery.time.min)"
//   // liveTrackingLabel.text = foods.
//    evaluationLabel.text = foods?.evalution
    offerLabel.text = "\(foods?.offer?.value)(Spend \(foods?.offer?.spend)SAR)"
    promotedLable.text = "\(foods?.is_promoted)"

}
   
}
