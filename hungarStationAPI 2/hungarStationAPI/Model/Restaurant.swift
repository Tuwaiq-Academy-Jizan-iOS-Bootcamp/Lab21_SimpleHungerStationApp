//
//  Restaurant.swift
//  hungarStationAPI
//
//  Created by Ahlam Ahlam on 08/05/1443 AH.
//

import Foundation

struct Restaurant:Codable{
    var data:[Dataa]
}
struct Dataa:Codable{
    var id :Int
    var name :String
    var category:String
    var delivery:Delivery
    var rating:Float
    var is_promoted:Bool
    var offer:Offer?
    var image:String
    var resturant_image:String
    
}
struct Delivery:Codable{
    var time:Time
    var cost:Cost
    
}
struct Offer:Codable{
    var value:String
    var spend:Int
    
    
}
struct Time:Codable{
    var min:Int
    var max:Int
    
}
struct Cost:Codable{
    var value:Double
    var currency:String
}



//
struct Menus:Codable{
    var menu:[Menu]
    
}
struct Menu:Codable {
    var id :Int
    var title:String
    var subtitle:String?
    var calories:Int?
    var price:Price
    var image:String
    
}
struct Price:Codable{
    var value:Int
    var currency:String
    
    
}





//struct Restaurant:Codable{
//    var data:[Dataa]
//}
//struct Dataa:Codable{
//    var id :Int
//    var name :String
//    var category:String
//    var delivery:Delivery
//    var rating:Float
//    var is_promoted:Bool
//    var offer:Offer?
//    var image:String
//    var resturant_image:String
//
//}
//struct Delivery:Codable{
//    var time:Time
//    var cost:Cost
//
//}
//struct Offer:Codable{
//    var value:String
//    var spend:Int
//
//
//}
//struct Time:Codable{
//    var min:Int
//    var max:Int
//
//}
//struct Cost:Codable{
//    var value:Double
//    var currency:String
//}
//


