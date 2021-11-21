//
//  ViewController.swift
//  Lab21
//
//  Created by زهور حسين on 10/04/1443 AH.
//

import UIKit
import SwiftUI

struct restaurant {
    var image: UIImage
    var name: String
    var restaurantrating: String
    var time: String
    var ordertracking: String
    var evaluation: String
    var logo: UIImage
    var discount: String
    var advertising: String
    
}


class ViewController: UIViewController {

    
   
    @IBOutlet weak var tableviewOne: UITableView!
    
    @IBOutlet weak var pigimageofheader: UINavigationItem!
    
    @IBOutlet weak var smallimageofheader: UIImageView!
    
    var arrayRestaurantname: [restaurant] = [restaurant(image: UIImage(named: "Picture1")!, name: "Herfy", restaurantrating: "Fast Food", time: "⏱ 40 - 50 minutes", ordertracking: "Delivery: 5 SR ⏳Live Tracking", evaluation: "⭐️3.8", logo: UIImage(named: "Herfyimage")!, discount: "50.0%Off Your Order(Spend 35 SAR)", advertising: "promoted"),restaurant(image: UIImage(named: "Picture2")!, name: "Pizza Hut", restaurantrating: "Italian food", time: "⏱ 45 - 55 minutes", ordertracking: "Delivery: 10 SR ⏳Live Tracking", evaluation: "⭐️4.4", logo: UIImage(named: "PizzaHutimage")!, discount: "40.0%Off Your Order(Spend 35 SAR)", advertising: "promoted"),restaurant(image: UIImage(named: "Picture3")!, name: "Applebee's", restaurantrating: "Grills,American", time: "⏱ 45 - 55 minutes", ordertracking: "LiveTracking", evaluation: "⭐️3.9", logo: UIImage(named: "Applebeesimage")!, discount: "30.0%Off Your Order(Spend 35 SAR)", advertising: "promoted"),restaurant(image: UIImage(named: "Picture4")!, name: "Kudu", restaurantrating: "Food fast", time: "⏱ 40 - 50 minutes", ordertracking: "Delivery: 5 SR ⏳Live Tracking", evaluation: "⭐️3.8", logo: UIImage(named: "Kuduimage")!, discount: "30.0%Off Your Order(Spend 35 SAR)", advertising: "promoted"),restaurant(image: UIImage(named: "Picture5")!, name: "Macdonald", restaurantrating: "Food fast", time: "⏱ 45 - 55 minutes", ordertracking: "Delivery: 10 SR ⏳Live Tracking", evaluation: "⭐️4.4", logo: UIImage(named: "Macdonaldimage")!, discount: "30.0%Off Your Order(Spend 35 SAR)", advertising: "promoted")]

    var Headerimage = ["imageheader1","imageheader2","imageheader3","imageheader4","imageheader5"]
        var value = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableviewOne.delegate = self
        tableviewOne.dataSource = self
                // Do any additional setup after loading the view.
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayRestaurantname.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath ) as! cellviewcontoroller
            
            cell.restaurantname.text = arrayRestaurantname[indexPath.row].name
            cell.restaurantrating.text = arrayRestaurantname[indexPath.row].restaurantrating
            cell.timedelivery.text = arrayRestaurantname[indexPath.row].time
            cell.ordertracking.text = arrayRestaurantname[indexPath.row].ordertracking
            cell.logoimage.image = arrayRestaurantname[indexPath.row].logo
            cell.restaurantevaluation.text = arrayRestaurantname[indexPath.row].evaluation
            cell.restaurantdiscount.text = arrayRestaurantname[indexPath.row].discount
        cell.restaurantadvertising.text = arrayRestaurantname[indexPath.row].advertising
            cell.restaurantimage.image = arrayRestaurantname[indexPath.row].image
            
           return cell
            
        }
        func tableView(_tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 105
        }
    @IBAction func remove(_ sender: UIStoryboardSegue) {
    
    
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        
        
            
        }
    }
    
    @IBAction func swipeLeft(_ sender: Any) {
    }
}
