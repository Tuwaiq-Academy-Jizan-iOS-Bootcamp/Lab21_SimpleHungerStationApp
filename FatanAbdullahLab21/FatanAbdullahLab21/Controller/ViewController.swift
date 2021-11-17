//
//  ViewController.swift
//  FatanAbdullahLab21
//
//  Created by Faten Abdullh salem on 10/04/1443 AH.
//

import UIKit
struct HungerStation {
var mealImage:String
var theOfferH: String
var restaurantNameH : String
var mealTypeH: String
var DeliveryTimeH:String
var DeliveryPriceH:String
var TrackingH:String
var EvaluationH:String
}
class ViewController: UIViewController {
var arrayHS:[HungerStation] = []
var sendMealImage = ""
var sendTheOffer = ""
var sendrestaurantName = ""
var sendmealType = ""
var sendDeliveryTime = ""
var sendDeliverPrice = ""
var sendTracking = ""
var sendEvaluation = ""
    
var R1 = HungerStation(mealImage:"A1", theOfferH: "50%", restaurantNameH: "Herfy", mealTypeH: "Fast Food", DeliveryTimeH: "20-30", DeliveryPriceH: "30", TrackingH: "Live Tracking", EvaluationH:"Evaluation")
    
var R2 = HungerStation(mealImage: "A2", theOfferH: "25%", restaurantNameH: "Mac", mealTypeH: "Fast Food", DeliveryTimeH: "10-30", DeliveryPriceH: "25", TrackingH: "Live Tracking", EvaluationH: "Evaluation")
    
var R3 = HungerStation(mealImagemealImage: "S3", theOfferH: "50%", restaurantNameH: "Dunkin", mealTypeH:"Donuts", DeliveryTimeH:"15-30",DeliveryPriceH: "20", TrackingH: "Live Tracking", EvaluationH:"Evaluation")
    
@IBOutlet weak var HungerStationTableView: UITableView!
    
var Data : HungerStation?
    
override func viewDidLoad() {
super.viewDidLoad()
HungerStationTableView.delegate = self
HungerStationTableView.dataSource = self
arrayHS = [R1,R2,R3]


}
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayHS.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)  as! DataTVCell
    
    cell.ImageHungerStion.image = UIImage(named: arrayHS[indexPath.row].mealImage)
    
    cell.theOffer.text = arrayHS[indexPath.row].theOfferH
cell.RestauranName.text = arrayHS[indexPath.row].restaurantNameH
cell.MealType.text = arrayHS[indexPath.row].mealTypeH
cell.Evaluation.text = arrayHS[indexPath.row].EvaluationH
cell.DeliveryTime.text = arrayHS[indexPath.row].DeliveryTimeH
cell.DeliveryPrice.text = arrayHS[indexPath.row].DeliveryPriceH
    
return cell
    }
    
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "MySimple Hunger Station App"
}
func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return "end"
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
//sendMealImage = arrayHS[indexPath.row].sendMealImage
//    sendTheOffer = arrayHS[indexPath.row].sendTheOffer
//    sendrestaurantName = arrayHS[indexPath.row].sendrestaurantName
//    sendmealType = arrayHS[indexPath.row].sendmealType
//    sendDeliveryTime = arrayHS[indexPath.row].sendDeliveryTime
//    sendDeliverPrice = arrayHS[indexPath.row].sendDeliverPrice
//    sendTracking = arrayHS[indexPath.row].sendTracking
//    sendEvaluation = arrayHS[indexPath.row].sendEvaluation

    Data = arrayHS[indexPath.row]
performSegue(withIdentifier: "GoTo", sender: self)
}
}


