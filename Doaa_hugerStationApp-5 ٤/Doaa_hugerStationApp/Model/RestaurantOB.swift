//
//  RestaurantOB.swift
//  Doaa_hugerStationApp
//
//  Created by Dua'a ageel on 11/04/1443 AH.



import Foundation
struct Restorants:Codable {
    var data:[RestaurantOB]
}
struct RestaurantOB: Codable {
    let id: Int?
    let name, category: String?
    let delivery: Delivery?
    let rating: Double?
    let isPromoted: Bool?
    let offer: Offer?
    let image, resturantImage: String?

}


struct Delivery: Codable {
    let time: Time?
    let cost: Cost?
}


struct Cost: Codable {
    let value: Double?
    let currency: String?
}


struct Time: Codable {
    let min, max: Int?
}

struct Offer: Codable {
    let value: String?
    let spend: Int?
}
