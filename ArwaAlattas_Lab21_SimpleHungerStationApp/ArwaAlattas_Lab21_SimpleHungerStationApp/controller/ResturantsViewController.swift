//
//  ResturantsViewController.swift
//  ArwaAlattas_Lab21_SimpleHungerStationApp
//
//  Created by Arwa Alattas on 10/04/1443 AH.
//

import Foundation
import UIKit
class ResturantsViewController : UIViewController {
    
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantStar: UILabel!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantTypeFood: UILabel!
    @IBOutlet weak var deliveryPrice: UILabel!
    @IBOutlet weak var deliveryTime: UILabel!
    
    @IBOutlet weak var resturantImageView: UIImageView!
    
    
    @IBOutlet weak var menuTableView: UITableView!{
        didSet{
        menuTableView.delegate = self
            menuTableView.dataSource = self
        
        }}
    var selectMenu:Resturant?
     // objects and array for Applebee's Resturant
    var bigapplebeesburger = Meal(mealName: "Applebee's Burger", mealImage: "bigapplebeesburger", mealPrice: "45.0 SR")
    var shrimpFettuccine = Meal(mealName: "Shrimp Fettuccine", mealImage: "shrimpFettuccine", mealPrice: "67.0 SR")
    var SizzlingChicken = Meal(mealName: "Sizzling Chicken", mealImage: "SizzlingChicken", mealPrice: "48.0 SR")
    var applebeesMenu:[Meal] = []
    
    // objects and array for Herfy Resturant
    
    var bigHerfyWithCheese = Meal(mealName: "Big Herfy With Cheese", mealImage: "Big Herfy With Cheese", mealPrice: "16.0 SR")
    var chickenTortilla = Meal(mealName: "Chicken Tortilla", mealImage: "Chicken Tortilla", mealPrice: "16.0 SR")
    var indianBurger = Meal(mealName: "Indian Burger", mealImage: "Indian Burger", mealPrice: "15.0 SR")
    var herfyMenu:[Meal] = []
      
    // objects and array for Herfy Resturant
    
    var familyBlatter = Meal(mealName: "Family Blatter", mealImage: "Family Blatter", mealPrice: "150 SR")
    var prownMusselCombo = Meal(mealName: "Prown & Mussel Combo", mealImage: "prown & Mussel Combo", mealPrice: "55 SR")
    var sushiPlatter = Meal(mealName: "Sushi Platter", mealImage: "Sushi Platter", mealPrice: "170 SR")
    var oseanBasketMenu:[Meal] = []
    
    // araay for all array
    var menu :[Meal] = []
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    override func viewDidLoad() {
     // meals of Applebees
        applebeesMenu.append(bigapplebeesburger)
        applebeesMenu.append(shrimpFettuccine)
        applebeesMenu.append(SizzlingChicken)
        
      // meels of Herfy
        herfyMenu.append(bigHerfyWithCheese)
        herfyMenu.append(chickenTortilla)
        herfyMenu.append(indianBurger)
        
        
     //meels of Osean Basket
        
        oseanBasketMenu.append(familyBlatter)
        oseanBasketMenu.append(prownMusselCombo)
        oseanBasketMenu.append(sushiPlatter)
        
        if let resturant = selectMenu{
            resturantName.text = resturant.name
            resturantImage.image = UIImage(named: resturant.logo)
            resturantTypeFood.text = resturant.typefood
            resturantStar.text = resturant.star
            resturantImageView.image = UIImage(named: resturant.image)
        }
        
        
        
        
        
        
        
        if resturantName.text == "Applebee's"{
            menu = applebeesMenu
        } else if resturantName.text == "Herfy"{
            menu = herfyMenu
        }else {
            menu = oseanBasketMenu
        }
       
    }
   
    
}
extension ResturantsViewController:UITableViewDelegate{
    
   
    
    
}
extension ResturantsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! resturantMenuCell
       
            cell.productName.text = menu[indexPath.row].mealName
            cell.productImage.image = UIImage(named: menu[indexPath.row].mealImage)
            cell.productPrice.text = menu[indexPath.row].mealPrice
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
