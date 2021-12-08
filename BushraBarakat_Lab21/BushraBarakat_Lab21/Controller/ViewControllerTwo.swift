//
//  ViewControllerTwo.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import Foundation
import UIKit
class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var resturantImageView2: UIImageView!
    @IBOutlet weak var resturantLogoImageView2: UIImageView!
    @IBOutlet weak var resturantNamelabel2: UILabel!
    @IBOutlet weak var resturantRatinglabel2: UILabel!
    @IBOutlet weak var resturantTypeLabel2: UILabel!
    @IBOutlet weak var minumumMealPriceLabel2: UILabel!
    @IBOutlet weak var deliveryPriceLabel2: UILabel!
    @IBOutlet weak var deliveryTimeLabel2: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var resturantDiscountLabel2: UILabel!
    
//    menus array
    var herfyMenus :[Menu] =
    [Menu(mealImage: "tortilla", mealName: "Cambo Chicken Tortilla Larg Size", mealPrice: "34.0 SR"),
    Menu(mealImage: "kidsmeal", mealName: "Kids Meal", mealPrice: "15 SR"),
    Menu(mealImage: "chekenburger", mealName: "Large Chiken Burger", mealPrice: "34 SR")]
    var appleBeesMenus:[Menu] =
    [Menu(mealImage: "Fiesta Chicken Salad", mealName: "Fiesta Chicken Salad", mealPrice: "47 SR"),
    Menu(mealImage: "Sizzling Fajita Combo", mealName: "Sizzling Fajita Combo", mealPrice: "98 SR"),
    Menu(mealImage: "Cajun Shrimp Fettuccine", mealName: "Cajun Shrimp Fettuccine", mealPrice: "78 SR")]
    var blackDoseMenus: [Menu] =
    [Menu(mealImage: "Shaken", mealName: "Shaken", mealPrice: "25 SR"),
    Menu(mealImage: "Pistachio Milk Cake", mealName: "Pistachio Milk Cake", mealPrice: "30 SR"),
    Menu(mealImage: "Dulche De Leche", mealName: "Dulche De Leche", mealPrice: "22 SR")]
    
    var menus: [Menu] = []
    
    
    var selectResturant : Resturant?
    override func viewDidLoad() {
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        
        if let resturant = selectResturant {
            resturantImageView2.image = UIImage(named: resturant.resturantImage)
            resturantLogoImageView2.image = UIImage(named: resturant.resturantLogo)
            resturantNamelabel2.text = resturant.resturantName
            resturantRatinglabel2.text = resturant.resturantRating
            resturantTypeLabel2.text = resturant.resturantType
            deliveryPriceLabel2.text = resturant.resturantDeliveryPrice
            deliveryTimeLabel2.text = resturant.resturantDeliveryTime
            resturantDiscountLabel2.text = resturant.resturantDiscount

        }
        
        if resturantNamelabel2.text == "Herfy"{
            menus = herfyMenus
            minumumMealPriceLabel2.text = "30 SR"
            
        }else if resturantNamelabel2.text == "Applebees"{
            menus = appleBeesMenus
            minumumMealPriceLabel2.text = "50 SR"
        }else if resturantNamelabel2.text == "Black Dose"{
            menus = blackDoseMenus
            minumumMealPriceLabel2.text = "20 SR"
        }
    }
    
}
            
    


extension ViewControllerTwo:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.mealImageView.image = UIImage(named: menus[indexPath.row].mealImage)
        cell.mealNameLabel.text = menus[indexPath.row].mealName
        cell.mealPriceLabel.text = menus[indexPath.row].mealPrice
    
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150    }
   
    


}



