//
//  Mune.swift
//  SimpleHungerStationApp
//
//  Created by Afrah Omar on 12/04/1443 AH.
//

import Foundation

struct Restorants:Codable {
    var data:[RestorantsData]
}
struct RestorantsData:Codable {
    var id: Int
    var name: String
    var category: String
    var delivery: Delivery
    var rating: Double
    var is_promoted: Bool
    var offer: Offer?
    var image: String
    var resturant_image:String
}
struct Delivery:Codable {
    var time:Time
    var cost:Cost
}
struct Time:Codable {
    var min:Int
    var max:Int
}
struct Cost:Codable {
    var value:Double
    var currency:String
}
struct Offer:Codable {
    var value:String
    var spend:Int
}
// Menus JSON
struct Menus:Codable {
    var menu:[MenusData]
}
struct MenusData:Codable {
    var id:Int
    var title:String
    var subtitle:String?
    var calories:Int?
    var price:Price
    var image:String
}
struct Price:Codable {
    var value:Int
    var currency:String
}
