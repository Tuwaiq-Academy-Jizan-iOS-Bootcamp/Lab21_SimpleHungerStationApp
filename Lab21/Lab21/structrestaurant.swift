//
//  structrestaurant.swift
//  Lab21
//
//  Created by زهور حسين on 08/05/1443 AH.
//

import Foundation
struct ResturantResponse:Codable {
    var data:[Resturant]
}
struct Resturant: Codable {
    var id:Int
    var name:String
    var category:String
    var delivery:Delivery
    var rating: Float
    var is_promoted: Bool
    var offer:Offer?
    var image: String
    var resturant_image: String
}

struct Delivery: Codable {
    var time:Time
    var cost: Cost
}

struct Time:Codable {
    var min:Int
    var max:Int
}
struct Cost:Codable {
    var value:Float
    var currency:String
}
struct Offer:Codable {
    var value:String
    var spend:Int
}

