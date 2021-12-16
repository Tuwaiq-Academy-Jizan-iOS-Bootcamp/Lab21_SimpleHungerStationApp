//
//  Item.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 10/04/1443 AH.
//
import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let name: String
    let category: String
    let delivery: Delivery
    let rating: Float
    let is_promoted: Bool
    let offer: Offer?
    let image: String
    let resturant_image: String
}

// MARK: - Delivery
struct Delivery: Codable {
    let time: Time
    let cost: Cost
}

// MARK: - Cost
struct Cost: Codable {
    let value: Double
    let currency: String
}

// MARK: - Time
struct Time: Codable {
    let min: Int
    let max: Int
}

// MARK: - Offer
struct Offer: Codable {
    let value: String
    let spend: Int
}

//menu
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
