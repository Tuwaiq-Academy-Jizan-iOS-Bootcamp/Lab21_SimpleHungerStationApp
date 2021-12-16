//
//  APIhungerstation.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 05/05/1443 AH.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    var id: Int
    var name, category: String
    var delivery: Delivery
    var rating: Double
    var isPromoted: Bool
    var offer: Offer?
    var image, resturantImage: String

    enum CodingKeys: String, CodingKey {
        case id, name, category, delivery, rating
        case isPromoted = "is_promoted"
        case offer, image
        case resturantImage = "resturant_image"
    }
}

// MARK: - Delivery
struct Delivery: Codable {
    var time: Time
    var cost: Cost
}

// MARK: - Cost
struct Cost: Codable {
    var value: Double
    var currency: String
}

// MARK: - Time
struct Time: Codable {
    var min, max: Int
}

// MARK: - Offer
struct Offer: Codable {
    var value: String
    var spend: Int
}

