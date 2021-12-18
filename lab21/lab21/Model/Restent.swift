//
//  Restent.swift
//  lab21
//
//  Created by Ahlam Ahlam on 11/04/1443 AH.
//

import Foundation

import Foundation
struct Hungerstation {
    var resturantImage: String
    var logoImage: String
    var resturantName: String
    var typeFood: String
    var time: String
    var deliveryChrge: String
    var starResturant: String
    var minimum: String
    var menu: [Menu]
}
struct Menu{
    var productName: String
    var price: String
    var productImage: String
}
var resturants1 = Hungerstation(resturantImage: "1", logoImage: "maclogo", resturantName: "mac", typeFood: "Fast Food", time: "40-50 minutes", deliveryChrge: "50.0% Off Your order(Spend 35 SR)", starResturant: "3.8", minimum: "35 SR", menu: [Menu(productName: "Combo Big mac With Cheese Medium Size", price: "24 SR", productImage: "mac1"),Menu(productName: "Combo Super Herfy Medium Size", price: "30 SR", productImage: "mac2"),Menu(productName: "Combo Spicy Musahab Large Size", price: "24 SR", productImage: "mac3"),Menu(productName: "Combo Regular Musahab Large Size", price: "24 SR", productImage: "mac4"),Menu(productName: "Combo Grilled Chicken", price: "28 SR", productImage: "mac5"),Menu(productName: "Combo Bbq.Chicken", price: "32 SR", productImage: "H6"),Menu(productName: "Kiddie Meal Burger", price: "11 SR", productImage: "mac6")])

var resturants2 = Hungerstation(resturantImage: "2",logoImage: "Dlogo", resturantName: "DUNKIN", typeFood: "Coffee", time: "30-40 minutes", deliveryChrge: "5 SR Deliver(Spend 35 SR)", starResturant: "2.8", minimum: "20 SR", menu: [Menu(productName: "Munchkins Mix Box", price: "15 SR", productImage: "D1"),Menu(productName: "Banana Choco Chip", price: "11 SR", productImage: "D3"),Menu(productName: "Iced Caramel Macchiato", price: "14 SR", productImage: "D2"),Menu(productName: "Labnah Honey Toast", price: "14 SR", productImage: "D4"),Menu(productName: "Bottle Cold Brew Coffee", price: "11 SR", productImage: "D5"),Menu(productName: "Latte", price: "15 SR", productImage: "D6")])

var resturants3 = Hungerstation(resturantImage: "3",logoImage: "Alogo", resturantName: "Orginal Burger", typeFood: "Drinks-bakery-candy", time: "30-40 minutes", deliveryChrge: "5 SR Deliver(Spend 35 SR", starResturant: "4.8", minimum: "40 SR", menu: [Menu(productName: "Happiness Pac", price: "119 SR", productImage: "A1"),Menu(productName: "Single Value Scoop Cup", price: "14 SR", productImage: "A2"),Menu(productName: "Thick Shake Bottle Large Size", price: "31 SR", productImage: "A3"),Menu(productName: "Triple Junior Scoops Sundae Cup", price: "28 SR", productImage: "A4"),Menu(productName: "Full Tub", price: "449 SR", productImage: "A5"),Menu(productName: "Celebration Pack Offer", price: "99 SR", productImage: "A6")])
