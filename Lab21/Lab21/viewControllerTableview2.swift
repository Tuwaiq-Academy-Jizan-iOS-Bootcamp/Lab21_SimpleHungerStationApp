//
//  viewControllerTableview.swift
//  Lab21
//
//  Created by زهور حسين on 10/04/1443 AH.
//

import Foundation
import UIKit
struct menu {
var mealimage: UIImage
var mealtitle: String
var mealprice: String
  
}


class viewControllerTableview2: UIViewController{
    
    @IBOutlet weak var tableviewTow: UITableView!
    @IBOutlet weak var imagetableview2: UIImageView!
    
    @IBOutlet weak var logotableviewTow: UIImageView!
    
    @IBOutlet weak var nameintableview2: UILabel!
    
    @IBOutlet weak var evaluationtableview2: UILabel!
    
    @IBOutlet weak var priceintableview2: UILabel!
    
    @IBOutlet weak var deliverytableview2: UILabel!
    
    @IBOutlet weak var timedeliverytableview2: UILabel!
    
    
    @IBOutlet weak var imageclltableview2: UIImageView!
    
    
    @IBOutlet weak var namemealincell: UILabel!
    
    @IBOutlet weak var pricemealincell: UILabel!
    
    
    
    var HungerStation : [menu] = []
    
    if restaurantname.text == "Herfy"{
        HungerStation = restaurantHerfy
    }else if restaurantname.text == "Pizza Hut"{
           
            HungerStation = restaurantPizzahut
    } else if restaurantname.text = "Applebee's"{
            HungerStation.text = restaurantApplebees
    } else if restaurantname.text = "Kudu"{
            HungerStation = restaurantkudu
    } else{
           HungerStation = restaurantMac
                    }
                }
            
        
    
    
    var restaurantHerfy: [menu] = [menu(mealimage: UIImage(named: "Face1")!, mealtitle: "Large chicken tortilla meal", mealprice: "34.0💸"),menu(mealimage: UIImage(named: "Face2")!, mealtitle: "Large Super Chicken meal", mealprice: "34.0💸"),menu(mealimage: UIImage(named: "Face3")!, mealtitle: "Large grilled Chicken meal", mealprice: "28.0💸"),menu(mealimage: UIImage(named: "Face4")!, mealtitle: "Large Chicken Nawaem meal", mealprice: "27.0💸"),menu(mealimage: UIImage(named: "Face5")!, mealtitle: "Large chicken super chili meal", mealprice: "32.0💸")]
    
    var restaurantPizzahut: [menu] = [menu(mealimage: UIImage(named: "Face6")!, mealtitle:  "Magarita", mealprice: "27.0💸"),menu(mealimage: UIImage(named: "Face7")!, mealtitle: "Vegetables", mealprice: "15.0💸"),menu(mealimage: UIImage(named: "Face8")!, mealtitle: "Spicy chicken ranch", mealprice: "27.0💸"),menu(mealimage: UIImage(named: "Face9")!, mealtitle: "Cheese lover", mealprice: "34.0💸"),menu(mealimage: UIImage(named: "Face10")!, mealtitle: "Classic pepperoni", mealprice: "32.0💸")]
    
    var restaurantApplebees: [menu] = [menu(mealimage: UIImage(named: "Face11")!, mealtitle: "Appetizer platter", mealprice: "78.0💸"),menu(mealimage: UIImage(named: "Face12")!, mealtitle: "Chicken quesadilla", mealprice: "29.0💸"),menu(mealimage: UIImage(named: "Face13")!, mealtitle: "Mozzarella sticks", mealprice: "29.0💸"),menu(mealimage: UIImage(named: "Face14")!, mealtitle: "Hot cheese nachos", mealprice: "27.0💸"),menu(mealimage: UIImage(named: "Face15")!, mealtitle: "Caesar salad", mealprice: "10.0💸")]
    
    var restaurantkudu: [menu] = [menu(mealimage: UIImage(named: "Face16")!, mealtitle: "Chicken kudu meal", mealprice: "29.0💸"),menu(mealimage: UIImage(named: "Face17")!, mealtitle: "Meat kudu meal", mealprice: "34.0💸"),menu(mealimage: UIImage(named: "Face18")!, mealtitle: "Grilled chicken meal", mealprice: "34.0💸"),menu(mealimage: UIImage(named: "Face19")!, mealtitle: "Veggie meal", mealprice: "27.0💸"),menu(mealimage: UIImage(named: "Face20")!, mealtitle: "kids chicken burger", mealprice: "14.0💸")]
    
    var restaurantMac: [menu] = [menu(mealimage: UIImage(named: "Face21")!, mealtitle: "Kit kat donut", mealprice: "7.0💸"),menu(mealimage: UIImage(named: "Face22")!, mealtitle: "Strawberry donut", mealprice: "7.0💸"),menu(mealimage: UIImage(named: "Face23")!, mealtitle: "Kitkat donut with coffee", mealprice: "14.0💸"),menu(mealimage: UIImage(named: "Face24")!, mealtitle: "Croissant with coffee then", mealprice: "14.0💸"),menu(mealimage: UIImage(named: "Face25")!, mealtitle: "Large cappuccino", mealprice: "7.0💸")]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewTow.delegate = self
        tableviewTow.dataSource = self
    }

}
    
    extension viewControllerTableview2: UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         //   return .count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellviewcontoroller
         
            
        }
    }
}

