//
//  MenuOB.swift
//  Doaa_hugerStationApp
//
//  Created by Dua'a ageel on 11/04/1443 AH.



import Foundation
struct MenuOB: Codable {
    let menu: [Menu]?
}


struct Menu: Codable {
    let id: Int?
    let title: String?
    let subtitle, calories: String?
    let price: Price?
    let image: String?
}


struct Price: Codable {
    let value: Int?
    let currency: String?
}
