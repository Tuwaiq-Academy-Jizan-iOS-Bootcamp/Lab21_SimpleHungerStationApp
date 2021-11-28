//
//  RestrantData.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 10/04/1443 AH.
//

import Foundation
import UIKit
struct Menu {
    var nameMeal: String
    var sar : String
    var imageMenu : String
}
struct Restrunt {
    var name : String
    var imageRestrant : String
    var delevriSAR : String
    var timeToTake : String
    var imageLogo : String
    var evaluation : Double
    var typeOfTheFoods : String
    var closeRestruant : String
    var menuOfRestruant = [Menu]()


    static var restrants = [
        Restrunt(name: "Time Drink", imageRestrant:"creazy dreank", delevriSAR: "This Over For You 5 SAR", timeToTake: "30 - 50", imageLogo: "عصير تايم",evaluation: 4.9,typeOfTheFoods: "Drink and Swit",closeRestruant: "Theis Restuarnt Close at 23:30",menuOfRestruant: [Menu(nameMeal: "ICE Mango", sar: "SAR 18 ", imageMenu: "ICE"),Menu(nameMeal: "Serlack", sar: "SAR 20 ", imageMenu: "Serilack"),Menu(nameMeal: "فراولة", sar: "SAR 20", imageMenu: "فراولة"),Menu(nameMeal: "Creazy", sar: "SAR 17.50", imageMenu: "creazy dreank")]),
    Restrunt(name: "Pizza Hut", imageRestrant: "pizza super", delevriSAR:"This Over For You 20 SAR", timeToTake: "10 - 30", imageLogo: "Pizza Hut",evaluation: 2.2, typeOfTheFoods: "Pizza Only",closeRestruant: "Theis Restuarnt Close at 24:00",menuOfRestruant: [Menu(nameMeal: "pizza hut", sar: "SAR 22 ", imageMenu: "pizza pironi"),Menu(nameMeal: "PizzaSuper", sar: "SAR 28 ", imageMenu: "pizza super"),Menu(nameMeal: "Pizza Ittali", sar: "SAr 24", imageMenu: " pizzaittali ")]),
        Restrunt(name: "Macdownalds", imageRestrant: "big  mac", delevriSAR: "This Over For You 20 SAR", timeToTake: "30 - 50 ", imageLogo: "MacLogo", evaluation: 2.3,typeOfTheFoods: "Fast Food",closeRestruant: "Theis Restuarnt Close at 3:00",menuOfRestruant: [Menu(nameMeal: "GrandCheakin", sar: "SAR 33", imageMenu: "MackDo"),Menu(nameMeal: "Big Mac", sar: "SAR 22", imageMenu: "big  mac"),Menu(nameMeal: "Over Lunch", sar: "SAR 27", imageMenu: "lunch meal"),Menu(nameMeal: "Over Mac", sar: "SAR 13 ", imageMenu: "Over Mac"),Menu(nameMeal: "Texsti", sar: "SAR 32", imageMenu: "texsti")]),
    Restrunt(name: "KFC", imageRestrant: "kfc", delevriSAR: "This Over For You 10 SAR", timeToTake: "30 - 50", imageLogo: "kintaki" , evaluation: 4.4, typeOfTheFoods: "fast food", closeRestruant: "Theis Restuarnt Close at 10:30",menuOfRestruant: [Menu(nameMeal: "ChekinSt", sar: "SAR 24.50 ", imageMenu: "big chekin"),Menu(nameMeal:"For 2 Person" , sar: "SAR 42", imageMenu: "Our New"),Menu(nameMeal: "Over big siz", sar: "SAE 22", imageMenu: "Over"),Menu(nameMeal: "Red Hot", sar: "SAR 25", imageMenu: "Red Hot")]),
        Restrunt(name: "Herfi", imageRestrant: "herfi restruant", delevriSAR: "This Over For You 9 SAR", timeToTake: "30 - 20", imageLogo: "hefilogo", evaluation: 2.9, typeOfTheFoods: "fast food",closeRestruant: "Theis Restuarnt Close at 11:00",menuOfRestruant: [Menu(nameMeal: "Tortilla", sar: "SAR 21", imageMenu: "twritella"),Menu(nameMeal: "Compo", sar: "SAR 19", imageMenu: "compo"),Menu(nameMeal: "Dbelha2Big", sar: "SAR 30", imageMenu: "dobel"),Menu(nameMeal: "Super chekin", sar: "SAR 27", imageMenu: "swper chekin"),Menu(nameMeal: "Btito", sar: "SAR 5", imageMenu: "bataito")])]

}
