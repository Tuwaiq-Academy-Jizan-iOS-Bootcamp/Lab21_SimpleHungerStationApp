//
//  DetailsViewController.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 10/04/1443 AH.
//

import Foundation
import UIKit
class DetailsViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var delivaeryTime: UILabel!
    @IBOutlet weak var typeFood: UILabel!
    @IBOutlet weak var minimumLable: UILabel!
    @IBOutlet weak var evluationLabel: UILabel!
    @IBOutlet weak var delivery: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    var selectedItem:Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        if let food = selectedItem {
            menuImage.image = UIImage(named: food.imageName)
            restaurantImage.image = UIImage(named: food.imageName)
            restaurantNameLabel.text = food.title
            delivery.text = food.deliveryCost
            delivaeryTime.text = "35SR"
            typeFood.text = food.typeFood
            minimumLable.text = food.deliveryCost
            evluationLabel.text = food.evaluation
        }
    }
    var data:[Item] = Item.data
   
    var menu: [MenuItem] = []
    
}
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItem!.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! ItemTableView
//        let image = UIImage(named: selectedItem!.menu[indexPath.row].imageName)
        cell.mealImage.image = UIImage(named: selectedItem!.menu[indexPath.row].imageName)
        cell.mealName.text = selectedItem!.menu[indexPath.row].mealName
        cell.purchaceValue.text = selectedItem!.menu[indexPath.row].price
        cell.accessoryType = .disclosureIndicator
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
}
//func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 200
//
//}
