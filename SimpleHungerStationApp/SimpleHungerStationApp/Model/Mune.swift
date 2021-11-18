//
//  Mune.swift
//  SimpleHungerStationApp
//
//  Created by Afrah Omar on 12/04/1443 AH.
//

import Foundation
struct Meal {
    var nameMeal : String
    var imageMeal : String
    var priceMeal : String
}
struct Restaurant {
    var nameResturant:  String
    var resturantType: String
    var resturantRating: String
    var timeMealPreparation: String
    var tracking: String
    var imageResturant:  String
    var resturantLogo: String
    var resturantOffers: String
    var deliveryChargeResturant: String
    var mimimum : String
}


var restaurants :[Restaurant] = [
    Restaurant(nameResturant: "Herfy", resturantType: "Fast Food", resturantRating: "3.8", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "1", resturantLogo: "19", resturantOffers: "50 %",deliveryChargeResturant: "",mimimum: "35"),
    //     ..................................
    Restaurant(nameResturant: "Applebee's", resturantType: "Grills,American", resturantRating: "3.9", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "2", resturantLogo: "31", resturantOffers: "50 %",deliveryChargeResturant: "",mimimum:"44"),
    //     ..................................
    Restaurant(nameResturant: "Ocean Basket", resturantType: "Sea Food", resturantRating: "3.9", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "3", resturantLogo: "30", resturantOffers: "50 %",deliveryChargeResturant: "", mimimum: "55")]


var herfyrestaurant :[Meal] = [
Meal(nameMeal: "Combo Super Tortilla", imageMeal: "4", priceMeal: "34.0 SR"),
Meal(nameMeal:"Combo Super Chicken ", imageMeal: "5", priceMeal: "32.0 SR"),
Meal(nameMeal: "Combo Herfy Wrap Reg ", imageMeal: "6", priceMeal: "30.0 SR"),
Meal(nameMeal: "Kiddie Meal Nuggets", imageMeal: "28", priceMeal: "25.0 SR"),
Meal(nameMeal: "Kiddie Meal Burger", imageMeal: "8", priceMeal: "11.0 SR"),
Meal(nameMeal: "Pieces Chicken Nuggets", imageMeal: "7", priceMeal: "9.0 SR")]

var appleBessrestaurants : [Meal] = [
    Meal(nameMeal: "Spinach Artichoke Dip", imageMeal: "9", priceMeal: "65.0 SAR"),
    Meal(nameMeal: "8 OZ. Top Sirloin", imageMeal: "10", priceMeal: "110.0 SR"),
    Meal(nameMeal: "Bourbon street Chicken + Shrimp", imageMeal: "11", priceMeal: "67.0 SR"),
    Meal(nameMeal: "Chicken Tenders Plate", imageMeal: "12", priceMeal: "55.0 SR"),
    Meal(nameMeal: "Three-Cheese Chicken Penne", imageMeal: "13", priceMeal: "44.0 SR")]
var oceanBasketrestaurants : [Meal] = [
    Meal(nameMeal: "Meze Sampler", imageMeal: "14", priceMeal: "49.0 SR"),
    Meal(nameMeal: "Halloumi Cheese", imageMeal: "15", priceMeal: "30.0 SR"),
    Meal(nameMeal: "Dynamite Shrimp ", imageMeal: "16" , priceMeal: "47.0SR"),
    Meal(nameMeal: "Sushi Platter", imageMeal: "17", priceMeal: "72.0 SR"),
    Meal(nameMeal: "hummus", imageMeal: "18", priceMeal: "35.0 SR")]
