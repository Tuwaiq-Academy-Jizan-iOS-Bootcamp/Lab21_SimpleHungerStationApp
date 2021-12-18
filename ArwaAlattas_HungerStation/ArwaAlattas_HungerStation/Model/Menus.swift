//
//  Menus.swift
//  ArwaAlattas_HungerStation
//
//  Created by Arwa Alattas on 07/05/1443 AH.
//

import Foundation
struct Menus:Codable{
    var menu:[Menu]
    
}
struct Menu:Codable {
    var id :Int
    var title:String
    var subtitle:String?
    var calories:Int?
    var price:Price
    var image:String
    
}
struct Price:Codable{
    var value:Int
    var currency:String   
}
