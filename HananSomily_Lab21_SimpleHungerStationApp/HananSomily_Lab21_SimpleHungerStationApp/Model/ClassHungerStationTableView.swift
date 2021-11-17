//
//  ClassHungerStationTableView.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//

import Foundation
import UIKit

struct HungerStationItem {
    var logo : UIImage
    var image : UIImage
    var name : String
    var discription : String
    var price : String
    var cookingTime : String
    var deleveryTime : String
    var evalution : String
    var detels : String
}
class ClassHungerStationTableView:UITableViewCell {
 
//class ClassHungerStationTableView:UITableViewCell {
//
    //@IBOutlet weak var logoCanteen: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var nameMealLabel: UILabel!
    @IBOutlet weak var descriptionMealLabel: UILabel!
    @IBOutlet weak var timeCookingLabel: UILabel!
    @IBOutlet weak var deliverTimeLabel: UILabel!
    @IBOutlet weak var liveTrackingLabel: UILabel!
    @IBOutlet weak var evaluationLabel: UILabel!
    
    @IBOutlet weak var displayPannerLabel: UILabel!
    

var foods:HungerStationItem?
override func awakeFromNib() {
    super.awakeFromNib()
    logoImage.image = foods?.logo
    imageMeal.image = foods?.image
    nameMealLabel.text = foods?.name
    descriptionMealLabel.text = foods?.discription
    timeCookingLabel.text = foods?.cookingTime
    deliverTimeLabel.text = foods?.deleveryTime
   // liveTrackingLabel.text = foods.
    evaluationLabel.text = foods?.evalution
    displayPannerLabel.text = foods?.detels

}
    func printElement(logoo:UIImage , imagee:UIImage , name:String , description:String , timeCook :String , timeDelever :String , evaluteStar : String ,
        detel : String){
        logoImage.image = logoo
        imageMeal.image = imagee
        nameMealLabel.text = name
        descriptionMealLabel.text = description
        timeCookingLabel.text = timeCook
        deliverTimeLabel.text = timeDelever
       // liveTrackingLabel.text = foods.
       evaluationLabel.text = evaluteStar
        displayPannerLabel.text = detel
//evalut : String
    }
   
}
