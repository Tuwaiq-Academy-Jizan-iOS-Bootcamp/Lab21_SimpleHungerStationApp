//
//  Menu.swift
//  NouraLab21
//
//  Created by NoON .. on 11/04/1443 AH.
//

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
var resturants1 = Hungerstation(resturantImage: "1", logoImage: "logo1", resturantName: "Herfy", typeFood: "Fast Food", time: "40-50 minutes", deliveryChrge: "50.0% Off Your order(Spend 35 SR)", starResturant: "3.8", minimum: "35 SR", menu: [Menu(productName: "Combo Big Herfy With Cheese Medium Size", price: "24 SR", productImage: "H1"),Menu(productName: "Combo Super Herfy Medium Size", price: "30 SR", productImage: "H2"),Menu(productName: "Combo Spicy Musahab Large Size", price: "24 SR", productImage: "H3"),Menu(productName: "Combo Regular Musahab Large Size", price: "24 SR", productImage: "H4"),Menu(productName: "Combo Grilled Chicken", price: "28 SR", productImage: "H5"),Menu(productName: "Combo Bbq.Chicken", price: "32 SR", productImage: "H6"),Menu(productName: "Kiddie Meal Burger", price: "11 SR", productImage: "H7"),Menu(productName: "Combo Herfy Wrap", price: "31 SR", productImage: "H8")])
var resturants2 = Hungerstation(resturantImage: "2",logoImage: "logo2", resturantName: "DUNKIN", typeFood: "Coffee", time: "30-40 minutes", deliveryChrge: "5 SR Deliver(Spend 35 SR)", starResturant: "2.8", minimum: "20 SR", menu: [Menu(productName: "Munchkins Mix Box", price: "15 SR", productImage: "D1"),Menu(productName: "Banana Choco Chip", price: "11 SR", productImage: "D3"),Menu(productName: "Iced Caramel Macchiato", price: "14 SR", productImage: "D2"),Menu(productName: "Labnah Honey Toast", price: "14 SR", productImage: "D4"),Menu(productName: "Bottle Cold Brew Coffee", price: "11 SR", productImage: "D5"),Menu(productName: "Latte", price: "15 SR", productImage: "D6"),Menu(productName: "Mocha", price: "10 SR", productImage: "D7"),Menu(productName: "Kit Kat Donut", price: "5 SR", productImage: "D8")])
var resturants3 = Hungerstation(resturantImage: "3",logoImage: "logo3", resturantName: "Baskin Robbins", typeFood: "Drinks-bakery-candy", time: "30-40 minutes", deliveryChrge: "5 SR Deliver(Spend 35 SR", starResturant: "4.8", minimum: "40 SR", menu: [Menu(productName: "Happiness Pac", price: "119 SR", productImage: "B1"),Menu(productName: "Single Value Scoop Cup", price: "14 SR", productImage: "B2"),Menu(productName: "Thick Shake Bottle Large Size", price: "31 SR", productImage: "B3"),Menu(productName: "Triple Junior Scoops Sundae Cup", price: "28 SR", productImage: "B4"),Menu(productName: "Full Tub", price: "449 SR", productImage: "B5"),Menu(productName: "Celebration Pack Offer", price: "99 SR", productImage: "B6"),Menu(productName: "Double Bundle 2 Jr Sundae", price: "19 SR", productImage: "B7"),Menu(productName: "Brownie Ala Mode Val", price: "28 SR", productImage: "B8")])
