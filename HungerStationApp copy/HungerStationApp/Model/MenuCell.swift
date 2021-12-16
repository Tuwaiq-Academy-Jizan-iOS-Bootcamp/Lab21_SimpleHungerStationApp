//
//  MenuCell.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 12/05/1443 AH.
//

import Foundation
// Menus JSON
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
