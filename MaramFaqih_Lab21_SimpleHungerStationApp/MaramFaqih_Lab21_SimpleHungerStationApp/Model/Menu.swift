//
//  Resturant.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//

import Foundation
import UIKit
// struct Menu{
//    var mealName : String
//    var mealImage : UIImage
//    var mealPrice : String
//
//}
struct MenuResturant:Codable{
     var menu : [Menu]
 
}
struct Menu:Codable{
    var id : Int
    var title : String
    var subtitle : String?
    var calories : Int?
    var price : Price
    var image : String
   
}
struct Price:Codable{
    var value : Int
    var currency : String
}
