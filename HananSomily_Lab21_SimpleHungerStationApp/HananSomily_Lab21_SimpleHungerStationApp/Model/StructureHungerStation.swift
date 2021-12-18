//
//  StructureHungerStation.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//
//
//import Foundation
//import UIKit
//struct HungerStationItem {
//    var image : UIImage
//    var name : String
//    var discription : String
//    var price : String
//    var cookingTime : String
//    var deleveryTime : String
//    var evalution : Double
//    
//    static var food = [
//        [HungerStationItem(image:UIImage(named: "pizza")!, name: "Pizza", discription: "italic Pizza ", price: "30 SAR", cookingTime: "30 - 40 munites", deleveryTime: "30 munites", evalution: 4.8 ), HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9),HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9)],
//        [HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9),HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9),HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9)],
//        [HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9),HungerStationItem(image: UIImage(named: "pizza1")!, name: "Pizza 2", discription: "pizaa .....", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: 3.9)]
//    ]
//    
//}
 
//class StructureHungerStation : UITableViewCell {
//    func printElement( imagee:UIImage , name:String , description:String , timeCook :String , timeDelever :String ,evalut : String){
//       
//        imageMeal.image = imagee
//        nameMealLabel.text = name
//        descriptionMealLabel.text = description
//        timeCookingLabel.text = timeCook
//        deliverTimeLabel.text = timeDelever
//       // liveTrackingLabel.text = foods.
//        evaluationLabel.text = evalut
//
//    }
//}

/////////////////
/////    @IBAction func swipLeft(_ sender: UISwipeGestureRecognizer) {
//        if i != 0 {
//        i -= 1
//        } else {
//            i = resturant.count-1 }
//    View1.image = UIImage(named: resturant[i])
//        }
//
//    @IBAction func swipRight(_ sender: UISwipeGestureRecognizer) {
//        if i != resturant.count - 1 {
//            i += 1
//        } else {
//            i = 0 }
//    View1.image = UIImage(named: resturant[i])
//        }
struct HungerStationAPI:Codable{
    var data:[Data]
}
struct Data:Codable{
    var id:Int
    var name:String
    var category:String
    var delivery:Delivery
    var rating:Float
    var is_promoted:Bool
    var offer:Offer
    var image:String
    var resturant_image:String
}
struct Delivery:Codable{
    var time:Time
    var cost:Cost
}
struct Time:Codable{
    var min:Int
    var max:Int
}
struct Cost:Codable{
    var value:Int
    var currency:String
}
struct Offer:Codable{
    var value:String
    var spend:Int
}
