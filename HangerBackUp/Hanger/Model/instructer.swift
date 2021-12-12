//
//  StaticData.swift
//  Hanger
//
//  Created by Yasir Hakami on 15/11/2021.
//

import Foundation
import UIKit

struct Menu { // spichal struct for the menu
    var mealImages:UIImage
    var nameOfMeal:String
    var PriceOfMeal:Double
    
    
}

struct HungerStaion {  //  Global Struction
    var mealImage:UIImage
    var logoOfRestaurant:UIImage
    var discountPromo:String
    var nameOfRestaurant:String
    var TypeOfFood:String
    var estimatedTime:String
    var evaluation:Double
    var munuOfRestaurant = [Menu]()
    
    static var restaurant = [
        
        
        // 1 - Hervy
        HungerStaion(mealImage: UIImage(named: "meal")!, logoOfRestaurant: UIImage(named: "1")!, discountPromo: "5 SAR For delviry (spend 35 SRA)", nameOfRestaurant: "Hervy", TypeOfFood: "Burger", estimatedTime: "45 - 55 minutes | Ô Live Tracking", evaluation: 2.3, munuOfRestaurant: [Menu(mealImages: UIImage(named: "33")!, nameOfMeal: "Burger", PriceOfMeal: 22.3),Menu(mealImages: UIImage(named: "CfSfc3SW8AAatl-")!, nameOfMeal: "Requllar Tortilla", PriceOfMeal: 44.5),Menu(mealImages: UIImage(named: "CNRYpW0UEAQSorn")!, nameOfMeal: "Spaicy Tortilla", PriceOfMeal: 67.6),Menu(mealImages: UIImage(named: "gg")!, nameOfMeal: "Checken Burger", PriceOfMeal: 34.8),Menu(mealImages: UIImage(named: "meal")!, nameOfMeal: "Beef Burger", PriceOfMeal: 44.2)]),
        
         // 2- Apple Bees
        HungerStaion(mealImage: UIImage(named: "applebees-brings-back")!, logoOfRestaurant: UIImage(named: "Apple Beesl")!, discountPromo: "50% offer For your Order (spend 35 SRA)", nameOfRestaurant: "Apple Bees", TypeOfFood: "Grills", estimatedTime: "55 - 60 minutes | Ô Live Tracking", evaluation: 4.2, munuOfRestaurant: [Menu(mealImages: UIImage(named: "crimpa")!, nameOfMeal: "Chrimpa", PriceOfMeal: 106),Menu(mealImages: UIImage(named: "Finney Country")!, nameOfMeal: "Finney Country", PriceOfMeal: 55.6),Menu(mealImages: UIImage(named: "Unknown")!, nameOfMeal: "Bruger Grill", PriceOfMeal: 44.5)]),
         
         // 3- Albaik
        HungerStaion(mealImage: UIImage(named: "29_ALBAIK")!, logoOfRestaurant: UIImage(named: "logo_ALBAIK")!, discountPromo: "10 SAR For delviry (spend 25 SRA)", nameOfRestaurant: "Albaik", TypeOfFood: "Fried Chicken", estimatedTime: "40 - 45 minutes | Ô Live Tracking", evaluation: 4, munuOfRestaurant: [Menu(mealImages: UIImage(named: "Jumbo Shrimp Meal")!, nameOfMeal: "Jumbo Shrimp Meal", PriceOfMeal: 44.5),Menu(mealImages: UIImage(named: "Chicken Fillet Burger")!, nameOfMeal: "Chicken Fillet Burger", PriceOfMeal: 35.5),Menu(mealImages: UIImage(named: "Fish Fillet Meal")!, nameOfMeal: "Fish Fillet Meal", PriceOfMeal: 16.5),Menu(mealImages: UIImage(named: "Chicken Fillet Sandwich")!, nameOfMeal: "Chicken Fillet Sandwich", PriceOfMeal: 22.2)]),
          
        // 4- Burger Land
        HungerStaion(mealImage: UIImage(named: "brland")!, logoOfRestaurant: UIImage(named: "logobl")!, discountPromo: "5 SAR For delviry (spend 30 SRA)", nameOfRestaurant: "Burger Land", TypeOfFood: "Burger", estimatedTime: "50 - 55 minutes | Ô Live Tracking", evaluation: 2.6, munuOfRestaurant: [Menu(mealImages: UIImage(named: "epic bruger")!, nameOfMeal: "Epic Bruger", PriceOfMeal: 24.5),Menu(mealImages: UIImage(named: "ranchbruger")!, nameOfMeal: "Ranch Bruger", PriceOfMeal: 130.4),Menu(mealImages: UIImage(named: "fried Checken bruger")!, nameOfMeal: "Fried Checken Bruger", PriceOfMeal: 35),Menu(mealImages: UIImage(named: "canggo bruger")!, nameOfMeal: "canggo bruger", PriceOfMeal: 27.6)])
                             
                
                             
                             
                             
                             
                             
                        
        
                             
                             
]
    
    
}


