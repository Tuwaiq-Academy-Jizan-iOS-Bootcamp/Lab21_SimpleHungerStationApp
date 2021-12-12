//
//  Resturant.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//

//import Foundation
//import UIKit
//struct Resturant{
//    var name : String
//    var logo : UIImage
//    var image : UIImage
//    var cuisine : String
//    var deliveryTime :String
//    var rating : String
//    var theOffer : String
//    var trackingStatus : Bool
//    var deliveryPrice : String
//    var minimum : String
//    
//    var menu : [Menu]
//}

import Foundation
struct Restaurant : Codable{
   var data :[DataSet]
}

struct DataSet : Codable {
    var id : Int
    var name : String
    var category : String
    var delivery : Delivery
    var rating : Double
    var is_promoted : Bool
    var offer : Offer?
    var image : String
    var resturant_image : String
}
struct Delivery : Codable {
    var time : Time
    var cost : Cost
}
struct Offer : Codable{
    var value : String
    var spend : Int

}
struct Time : Codable{
    var min : Int
    var max : Int
}
struct Cost : Codable{
    var value : Double
    var currency : String
}
