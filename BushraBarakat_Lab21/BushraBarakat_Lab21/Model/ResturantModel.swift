//
//  ResturantModel.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import Foundation
struct Resturant: Codable{
    var data: [ResturantData]
}


struct ResturantData: Codable {
    let id: Int
    let name: String
    let category: String
    let delivery: Delivery
    let rating: Double
    let is_promoted: Bool
    let offer: Offer?
    let image: String
    let resturant_image: String

}


struct Delivery: Codable {
    let time: Time
    let cost: Cost
}


struct Cost: Codable {
    let value: Double
    let currency: String
}


struct Time: Codable {
    let min, max: Int
}


struct Offer: Codable {
    let value: String
    let spend: Int
}

