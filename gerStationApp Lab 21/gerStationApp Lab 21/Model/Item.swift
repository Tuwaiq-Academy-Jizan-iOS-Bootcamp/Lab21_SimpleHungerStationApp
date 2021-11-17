//
//  Item.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 10/04/1443 AH.
//

import Foundation
struct Item {
    var title: String
    var typeFood: String
    var deliveryCost: String
    var deliveryTime: String
    var evaluation: String
    var imageName: String
    var location: String
    var menu: [MenuItem]
    
    
    static var data = [
        Item(title: "Herfy", typeFood: "Fast Food", deliveryCost: "5SR",
             deliveryTime: "40 - 50 minutes", evaluation: "3.8", imageName: "herfy1",
             location: "Jazan - AbuArish",
             menu: [
                MenuItem(mealName: "Combo Chicken Tortilla Large Size", imageName: "1", price: "34SR"),
                MenuItem(mealName: "Combo Super Chicken Large Size", imageName: "2", price: "34SR"),
                MenuItem(mealName: "Combo Grilled Chicken Large Size", imageName: "3", price: "28SR"),
                MenuItem(mealName: "Combo Chicken Tender Large Size", imageName: "4", price: "27SR"),
                MenuItem(mealName: "Combo Super Chili Large Size", imageName: "5", price: "26SR")
             ]),
        
        Item(title: "Ocean Basket", typeFood: "Sea Food", deliveryCost: "5SR",
             deliveryTime: "45 - 55 minutes", evaluation: "3.8", imageName: "Ocean Basket1",
             location: "Jazan - AbuArish",
             menu: [
                MenuItem(mealName: "Two Way Platter", imageName: "images1", price: "40SR"),
                MenuItem(mealName: "Mussels In Lemon Garlic", imageName: "images2", price: "72SR"),
                MenuItem(mealName: "Salmon And Avocado Greek Salad", imageName: "images3", price: "80SR"),
                MenuItem(mealName: "Nigiri Prawn 3", imageName: "images4", price: "35SR"),
                MenuItem(mealName: "suchi and Salmon", imageName: "images5", price: "60SR")
             ]),
        
        Item(title: "Applebee's", typeFood: "Fast Food", deliveryCost: "5SR",
             deliveryTime: "45 - 55 minutes", evaluation: "3.9", imageName: "Applebee's1",
             location: "Jazan - AbuArish",
             menu: [
                MenuItem(mealName: "BROWNIE BITE", imageName: "image001", price: "25SR"),
                MenuItem(mealName: "BASKET OF FRIES", imageName: "image002", price: "35SR"),
                MenuItem(mealName: "GRILLED CHEESE SANDWICH", imageName: "image003", price: "45SR"),
                MenuItem(mealName: "DOUBLE CRUNCH BONE-IN WINGS", imageName: "image004", price: "50SR"),
                MenuItem(mealName: "THREE-CHEESE CHICKEN PENNE", imageName: "image005", price: "65SR")
             ]),
    ]
}

struct MenuItem {
    var mealName: String
    var imageName: String
    var price: String
}
