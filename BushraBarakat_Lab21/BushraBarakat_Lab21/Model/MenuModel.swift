//
//  MenuModel.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 08/05/1443 AH.
//

import Foundation
struct MenuData: Codable {
    let menu: [Menu]
}


struct Menu: Codable {
    let id: Int
    let title: String
    let subtitle: String?
    let calories: Double?
    let price: Price
    let image: String
}

struct Price: Codable {
    let value: Int
    let currency: String
}
