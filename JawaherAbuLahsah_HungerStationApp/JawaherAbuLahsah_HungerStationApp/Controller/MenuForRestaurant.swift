//
//  MenuForRestaurant.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/04/1443 AH.
//

import Foundation
import UIKit
class MenuForRestaurant:UIViewController{
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantRatingLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    @IBOutlet weak var minimumOrderLabel: UILabel!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var deliveryTimeLable: UILabel!
    @IBOutlet weak var offersLabel: UILabel!
    @IBOutlet weak var restaurantDisplayImage: UIImageView!
    @IBOutlet weak var menuRestaurantTableView: UITableView!
    
    
    var menuMcDonald :[Meal] = [
    Meal(mealName: "Big Mac", mealPrice: 30.0, mealImage: "mm3"),
    Meal(mealName: "Chickenburger", mealPrice: 35.8, mealImage: "mm4"),
    Meal(mealName: "McChicken", mealPrice: 20.6, mealImage: "mm5"),
    Meal(mealName: "Grand chicken", mealPrice: 35.8, mealImage: "mm6"),
    Meal(mealName: "Big Mac", mealPrice: 40.0, mealImage: "mm6"),
    Meal(mealName: "Happy meal", mealPrice: 30.0, mealImage: "mm8"),
    Meal(mealName: "Big meal", mealPrice: 45.8, mealImage: "mm9")
    ]
    var menuHerfy :[Meal] = [
    Meal(mealName: "Chicken nagget", mealPrice: 30.8, mealImage: "hm4"),
    Meal(mealName: "Herfy super star", mealPrice: 35.3, mealImage: "hm5"),
    Meal(mealName: "Chicken torilla", mealPrice: 20.5, mealImage: "hm6"),
    Meal(mealName: "Big herfy ", mealPrice: 15.8, mealImage: "hm7"),
    Meal(mealName: "Double herfy", mealPrice: 35.8, mealImage: "hm8")
    ]
    var menuCoffee :[Meal] = [
        Meal(mealName: "Espresso", mealPrice: 10.0, mealImage: "cm3"),
        Meal(mealName: "Cappuccino", mealPrice: 12.0, mealImage: "cm4"),
        Meal(mealName: "Latte", mealPrice: 13.0, mealImage: "cm5"),
        Meal(mealName: "Caramel Machiatto", mealPrice: 10.0, mealImage: "cm6"),
        Meal(mealName: "Mocha", mealPrice: 13.0, mealImage: "cm7"),
        Meal(mealName: "Chocolate", mealPrice: 14.0, mealImage: "cm8"),
        Meal(mealName: "Americano", mealPrice: 12.0, mealImage: "cm9")
    ]
    
    var menus : [Meal] = []
    
    var selectRestaurant : Restaurant?
    override func viewDidLoad() {
        if let meal = selectRestaurant{
            logoImageView.image = UIImage(named: meal.restaurantLogo)
            restaurantNameLabel.text = meal.restaurantName
            restaurantRatingLabel.text = String(meal.restaurantRating)
            restaurantTypeLabel.text = meal.restaurantType
            deliveryPriceLabel.text = meal.deliveryPrice
            offersLabel.text = meal.restaurantOffers
            restaurantDisplayImage.image = UIImage(named: meal.restaurantImage)
            deliveryPriceLabel.text = meal.deliveryPrice
            deliveryTimeLable.text = meal.deliveryTime
        }
        if restaurantNameLabel.text == "McDonald's" {
            menus = menuMcDonald
            minimumOrderLabel.text = "30"
        } else if restaurantNameLabel.text == "Herfy"{
            menus = menuHerfy
            minimumOrderLabel.text = "40"
        }else{
            menus = menuCoffee
            minimumOrderLabel.text = "20"
        }
    }
}
extension MenuForRestaurant:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as! CellElements
        cell.mealNameLabel.text = menus[indexPath.row].mealName
        cell.mealPriceLabel.text = String(menus[indexPath.row].mealPrice)
        cell.mealImageLabel.image = UIImage(named: menus[indexPath.row].mealImage)
    
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 150
    }
    
}
