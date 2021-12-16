//
//  RestaurantModel.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/04/1443 AH.
//

import Foundation
//struct Restaurant{
//    var restaurantName:String
//    var restaurantImage:String
//    var restaurantLogo:String
//    var restaurantOffers:String
//    var restaurantType:String
//    var deliveryTime:String
//    var restaurantRating:Double
//    var deliveryPrice:String
//}




struct Restaurant: Codable {
    var data: [RestaurantData]
}



struct RestaurantData: Codable {
    var id: Int
    var name: String
    var category: String
    var delivery: Delivery
    var rating: Float
    var is_promoted: Bool
    var offer: Offer?
    var image: String
    var resturant_image: String
}


struct Delivery: Codable {
    var time: Time
    var cost: Cost
}
struct Cost: Codable {
    var value: Double
    var currency: String
}

struct Time: Codable {
    var min: Int
    var max: Int
}

struct Offer: Codable {
    var value: String
    var spend: Int
}



