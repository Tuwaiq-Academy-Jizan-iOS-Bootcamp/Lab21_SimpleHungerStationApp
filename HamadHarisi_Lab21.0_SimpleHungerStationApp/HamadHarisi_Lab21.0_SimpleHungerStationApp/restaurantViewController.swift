//
//  restaurantViewController.swift
//  HamadHarisi_Lab21.0_SimpleHungerStationApp
//
//  Created by حمد الحريصي on 16/11/2021.
//
import Foundation
import UIKit

class restaurantViewController: UIViewController
{
    @IBOutlet var restaurantTableView: UITableView!
    
    
    var restrant1 = Restaurants(restaurantName: "herfy", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "35 m - 45 m ", ratingStars: "⭐️⭐️⭐️⭐️", foodName: "fast food", foodImage: UIImage(named:"burgar")!)
    var restrant2 = Restaurants(restaurantName: "Albauk", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "5 m - 10 m ", ratingStars: "⭐️⭐️⭐️⭐️", foodName: "fast food", foodImage: UIImage(named:"burgar")!)
    var restrant3 = Restaurants(restaurantName: "Mac", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "55 m - 1.5 m", ratingStars: "⭐️⭐️⭐️⭐️", foodName: "fast food", foodImage: UIImage(named: "herfy")!)
    var restrant4 = Restaurants(restaurantName: "starBooks", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "1 m - 3000 years", ratingStars: "⭐️", foodName: "fast food", foodImage: UIImage(named: "herfy")!)
      var mnue = Menu(price: "55 SR", name: "Burgar", description: " 🍔 and 🥤 and 🍟 ")
      
    var mnue12:[Menu] = []
    var Restaurantss:[Restaurants] = []
    
   var DataVC2 = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        mnue12.append(mnue)
        
        
        
        Restaurantss.append(restrant1)
        Restaurantss.append(restrant2)
        Restaurantss.append(restrant3)
        Restaurantss.append(restrant4)

        
        
    }
}
extension restaurantViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return mnue12.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xcode = restaurantTableView.dequeueReusableCell(withIdentifier: "cellInVC2") as! TableViewCell
        let cell = restaurantTableView.dequeueReusableCell(withIdentifier: "cellInVC2") as! TableViewCell
//      contant.image = mnue12[indexPath.row].name
//        xcode.foodImageInVC2.text = mnue12[indexPath.row].name
//      xcode.restaurantImage.image = Restaurantss[indexPath.row].restaurantImage
//        xcode.foodNameInVC2.text = mnue12[indexPath.row].description
        xcode.foodCostInVC2.text = mnue12[indexPath.row].price
        cell.foodImage.image       = Restaurantss[indexPath.row].foodImage
        cell.foodName.text         = Restaurantss[indexPath.row].foodName
        cell.restaurantImage.image = Restaurantss[indexPath.row].restaurantImage
        cell.restaurantName.text   = Restaurantss[indexPath.row].restaurantName
        cell.ratingStars.text      = Restaurantss[indexPath.row].ratingStars
        cell.deliveryTime.text     = Restaurantss[indexPath.row].deliveryTime
        
//        cell.deliveryTime.text     = Restaurantss[indexPath.row].deliveryTime
//      xcode.ratingStars.text = Restaurantss[indexPath.row].ratingStars
//      xcode.deliveryTime.text = Restaurantss[indexPath.row].deliveryTime
        return xcode
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//    dataVC1 = "\(Restaurantss[indexPath.row].foodImage)"
//    dataVC1 = "\(Restaurantss[indexPath.row].foodName)"
//    dataVC1 = "\(Restaurantss[indexPath.row].restaurantImage)"
//    dataVC1 = "\(Restaurantss[indexPath.row].restaurantName)"
//    performSegue(withIdentifier: "fromVC1toVC2", sender: self)
//    }
}
