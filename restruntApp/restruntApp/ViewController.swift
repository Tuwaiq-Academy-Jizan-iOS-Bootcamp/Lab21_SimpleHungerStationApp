//
//  ViewController.swift
//  restruntApp
//
//  Created by يوسف جابر المالكي on 12/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewFirstCpntroller: UITableView!
    
    var herfy = Restaurant(name: "Burger", image: UIImage(named: "Burger")!, Logo: UIImage(named: "M")!, star: "3.5⭐️", deliveryTime: "45-55", itemFood: "Fast Food", traking: "jjjj")
    
    
    
    var maCdunaldes = Restaurant(name: "Herfy", image: UIImage(named: "herfy")!, Logo: UIImage(named: "M")!, star: "3.5⭐️", deliveryTime: "45-55", itemFood: "Fast Food", traking: "jnknjknkjnjnjnjnjnjjn")
    
    
    
    var restaurants:[Restaurant] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFirstCpntroller.dataSource = self
        tableViewFirstCpntroller.delegate = self
        restaurants.append(herfy)
        restaurants.append(maCdunaldes)

    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantTableViewCell
        cell.imageFoodRestrunt.image = restaurants[indexPath.row].image
//        cell.logoRestarunt.image = restaurants[indexPath.row].Logo
        cell.nameOfRestarunt.text = restaurants[indexPath.row].name
        cell.itemRestarunt.text = restaurants[indexPath.row].itemFood
        cell.howTimeDelivery.text = restaurants[indexPath.row].deliveryTime
        cell.lifeTraking.text = restaurants[indexPath.row].traking
        cell.starOfRestarunt.text = restaurants[indexPath.row].star
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    
    
    
    
    
}
