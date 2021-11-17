//
//  ViewController.swift
//  HamadHarisi_Lab21.0_SimpleHungerStationApp
//
//  Created by حمد الحريصي on 15/11/2021.
//
import Foundation
import UIKit
class ViewController: UIViewController {

var restrant1 = Restaurants(restaurantName: "herfy", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "35 m - 45 m ", ratingStars: "⭐️⭐️⭐️⭐️", foodName: "fast food", foodImage: UIImage(named:"burgar")!)
var restrant2 = Restaurants(restaurantName: "Albauk", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "5 m - 10 m ", ratingStars: "⭐️⭐️⭐️⭐️", foodName: "fast food", foodImage: UIImage(named:"burgar")!)
var restrant3 = Restaurants(restaurantName: "Mac", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "55 m - 1.5 m", ratingStars: "⭐️⭐️⭐️⭐️", foodName: "fast food", foodImage: UIImage(named: "herfy")!)
var restrant4 = Restaurants(restaurantName: "starBooks", restaurantImage: UIImage(named: "herfy")!, deliveryTime: "1 m - 3000 years", ratingStars: "⭐️", foodName: "fast food", foodImage: UIImage(named: "herfy")!)
    @IBOutlet var foodTableView: UITableView!
    
    
//let foodImage = ["burgar","brger","foo","brger","brger"]
////let foodName = ["brger","brger","brger","brger","brger"]
//let restaurantImage = ["hrfy","hrfy","hrfy","hrfy","hrfy"]
////let restaurantName = ["McDonaldis","McDonaldis","McDonaldis","McDonaldis","McDonaldis",]
//let deliveryTime = ["25m - 45m ","25m - 45m ","25m - 45m ","25m - 45m ","25m - 45m "]
//let ratingStars = ["⭐️⭐️","⭐️⭐️","⭐️⭐️","⭐️⭐️","⭐️⭐️"]

    
    var Restaurantss:[Restaurants] = []
    
    
  var dataVC1 = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        foodTableView.delegate = self
        foodTableView.dataSource = self

        Restaurantss.append(restrant1)
        Restaurantss.append(restrant2)
        Restaurantss.append(restrant3)
        Restaurantss.append(restrant4)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let xcode2 = segue.destination as? restaurantViewController
        xcode2?.DataVC2 = dataVC1
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource
{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return Restaurantss.count
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
    let cell = foodTableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
    cell.foodImage.image       = Restaurantss[indexPath.row].foodImage
    cell.foodName.text         = Restaurantss[indexPath.row].foodName
    cell.restaurantImage.image = Restaurantss[indexPath.row].restaurantImage
    cell.restaurantName.text   = Restaurantss[indexPath.row].restaurantName
    cell.ratingStars.text      = Restaurantss[indexPath.row].ratingStars
    cell.deliveryTime.text     = Restaurantss[indexPath.row].deliveryTime

    return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    dataVC1 = "\(Restaurantss[indexPath.row].foodImage)"
    dataVC1 = "\(Restaurantss[indexPath.row].foodName)"
    dataVC1 = "\(Restaurantss[indexPath.row].restaurantImage)"
    dataVC1 = "\(Restaurantss[indexPath.row].restaurantName)"
    performSegue(withIdentifier: "fromVC1toVC2", sender: self)
    }
}
