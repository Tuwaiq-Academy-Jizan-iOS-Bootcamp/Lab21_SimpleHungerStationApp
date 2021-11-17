//
//  ViewController.swift
//  HamadHarisi_Lab21_SimpleHungerStationApp
//
//  Created by حمد الحريصي on 15/11/2021.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var restaurantsTableView: UITableView!
    
    let foodImage = ["spider"]
    let foodName = ["spider"]
    let restaurantImage = ["spider"]
    let restaurantName = ["McDonaldis"]
    let deliveryTime = ["25m - 45m "]
    let ratingStars = ["⭐️⭐️⭐️⭐️⭐️"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
     
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let orEnyName = restaurantsTableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        orEnyName.foodImageImg.image = UIImage(named: foodName[indexPath.row])
        orEnyName.foodNameLabel.text = foodName[indexPath.row]
//        orEnyName.restaurantNameLabel.text = restaurantName[indexPath.row]
        orEnyName.restaurantNameLabel.text = restaurantName[indexPath.row]
        return orEnyName
      
    }
    
    
}
