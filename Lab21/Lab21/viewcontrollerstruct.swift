//
//  viewcontrollerstruct.swift
//  Lab21
//
//  Created by زهور حسين on 08/05/1443 AH.
//

import Foundation
struct Menus:Codable {
    var menu:[Mnue]
}
struct Mnue: Codable {
    var id: Int
    var title: String
    var subtitle: String?
    var calories: Double?
    var price: Price
    var image: String
}
struct Price: Codable {
    var value: Int
    var currency: String
}


