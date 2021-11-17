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
}

var restaurants :[Restaurant] = [
        Restaurant(nameResturant: "Herfy", resturantType: "Fast Food", resturantRating: "3.8", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "1", resturantLogo: "19", resturantOffers: "50 %",deliveryChargeResturant: ""),
    //     ..................................
        Restaurant(nameResturant: "Applebee's", resturantType: "Grills,American", resturantRating: "3.9", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "2", resturantLogo: "20", resturantOffers: "50 %",deliveryChargeResturant: ""),
    //     ..................................
        Restaurant(nameResturant: "Ocean Basket", resturantType: "Sea Food", resturantRating: "3.9", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "3", resturantLogo: "21", resturantOffers: "50 %",deliveryChargeResturant: "")]


var herfyrestaurant :[Meal] = [
Meal(nameMeal: "Combo Super Tortilla Large Size", imageMeal: "4", priceMeal: "34"),
Meal(nameMeal:"Combo Super Chicken Large Size", imageMeal: "5", priceMeal: "32"),
Meal(nameMeal: "Combo Herfy Wrap Reg Large Size", imageMeal: "6", priceMeal: "30"),
Meal(nameMeal: "Combo Chicken Tender Nedium Size", imageMeal: "7", priceMeal: "25"),
Meal(nameMeal: "Kiddie Meal Burger", imageMeal: "7", priceMeal: "11"),
Meal(nameMeal: "Pieces Chicken Nuggets", imageMeal: "8", priceMeal: "9")]

var appleBessrestaurants : [Meal] = [
    Meal(nameMeal: "Spinach Artichoke Dip", imageMeal: "9", priceMeal: "65"),
    Meal(nameMeal: "8 OZ. Top Sirloin", imageMeal: "10", priceMeal: "110"),
    Meal(nameMeal: "Bourbon street Chicken + Shrimp", imageMeal: "11", priceMeal: "67"),
    Meal(nameMeal: "Chicken Tenders Plate", imageMeal: "12", priceMeal: "55"),
    Meal(nameMeal: "Three-Cheese Chicken Penne", imageMeal: "13", priceMeal: "44")]
var oceanBasketrestaurants : [Meal] = [
    Meal(nameMeal: "Meze Sampler", imageMeal: "14", priceMeal: "49"),
    Meal(nameMeal: "Halloumi Cheese", imageMeal: "15", priceMeal: "30"),
    Meal(nameMeal: "Dynamite Shrimp ", imageMeal: "16" , priceMeal: "47"),
    Meal(nameMeal: "Sushi Platter", imageMeal: "17", priceMeal: "72"),
    Meal(nameMeal: "hummus", imageMeal: "18", priceMeal: "35")]
