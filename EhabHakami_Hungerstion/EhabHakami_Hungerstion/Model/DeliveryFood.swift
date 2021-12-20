//
//  DeliveryFood.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 10/04/1443 AH.
//

import Foundation
import UIKit
struct DeliveryFood {
    var nameRestaurant:String
    
    var typeOfFood:String
    
    var photoFoods:UIImage
    
    var restaurantBrandImage:UIImage
    
    var estimatedTimeOfArrival:String
    
    var rateTheFood:Double
    
    var deliveryOffers:String
    var menuRestaurant: [Menu]
    // الفاصلة تقفل الاراي حق المطعم
    static var restaurant = [ DeliveryFood(nameRestaurant: "Herfe", typeOfFood: "Fast,Food", photoFoods: UIImage(named: "bifwithChies")!, restaurantBrandImage: UIImage(named: "herfeEmplem")!, estimatedTimeOfArrival: "30 - 40 minutes", rateTheFood: 4.4, deliveryOffers: "10real delivery Offers",menuRestaurant: [Menu(priceFood: "28SR", nameFood: "bifwithChies", photoFood: UIImage(named: "bifwithChies")!),Menu(priceFood: "35SR", nameFood: "bifwithChies", photoFood: UIImage(named: "bifwithChies")!)]),
        
                              
        DeliveryFood(nameRestaurant: "macdonlds", typeOfFood: "Fast,Food", photoFoods: UIImage(named: "grandchaken")!, restaurantBrandImage: UIImage(named: "emplemmack")!, estimatedTimeOfArrival: "20 - 30 minutes", rateTheFood: 2.8, deliveryOffers: "Free delivery Offers", menuRestaurant: [Menu(priceFood: "25SR", nameFood: "grandchaken", photoFood: UIImage(named: "grandchaken")!),Menu(priceFood: "20SR", nameFood: "macChiken2", photoFood: UIImage(named: "macChiken2")!)]),
                              
                              
                              
    DeliveryFood(nameRestaurant: "apple bees", typeOfFood: "Grills,American", photoFoods: UIImage(named: "chiesceac")!, restaurantBrandImage: UIImage(named: "applebees")!, estimatedTimeOfArrival: "45 - 55 minutes", rateTheFood: 3.5, deliveryOffers: "10real delivery Offers",menuRestaurant: [Menu(priceFood: "35SR", nameFood: "Chken", photoFood: UIImage(named: "chiesceac")!),Menu(priceFood: "40SR", nameFood: "appleBees2", photoFood: UIImage(named: "appleBees2")!)])
    
    
    
    
    
    
    
    
    
    ]
}


struct Menu{
    var priceFood:String
    var nameFood:String
    var photoFood:UIImage
    
    
}
