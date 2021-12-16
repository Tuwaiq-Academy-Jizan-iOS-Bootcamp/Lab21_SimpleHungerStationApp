//
//  MealModel.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 11/04/1443 AH.
//

import Foundation

struct Meal:Codable{
    var menu:[Menu]
}

struct Menu: Codable {
    var id: Int
    var title: String
    var subtitle: String?
    var calories: Int?
    var price: Cost
    var image: String
}

//struct Price: Codable {
//    let value: Int
//    let currency: String
//}
