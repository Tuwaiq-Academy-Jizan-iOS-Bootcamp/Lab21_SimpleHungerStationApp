//
//  Menu.swift
//  HungerStationApp
//
//  Created by Ahmad Barqi on 12/05/1443 AH.
//

import UIKit
struct Menus:Codable {
    var menu:[MenusData]
}
struct MenusData:Codable {
    var id:Int
    var title:String
//    العنوان الفرعي
    var subtitle:String?
//    سعرات حرارية
    var calories:Int?
    var price:Price
    var image:String
}
struct Price:Codable {
    var value:Int
    var currency:String
}
