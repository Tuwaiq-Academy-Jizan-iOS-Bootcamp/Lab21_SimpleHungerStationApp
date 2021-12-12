//
//  ViewController.swift
//  Hanger
//
//  Created by Yasir Hakami on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hungerTableView: UITableView!
    var restaurants = HungerStaion.restaurant
    var menuSander = HungerStaion.restaurant[0].munuOfRestaurant
    var imageOfmeal = HungerStaion.restaurant[0].mealImage
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hungerTableView.dataSource = self
        hungerTableView.delegate = self
        
        
      
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendMune = segue.destination as! MenuTableView
        sendMune.menu = menuSander
        sendMune.imageOfresturant = imageOfmeal
    }
    @IBAction func unwind(segue:UIStoryboardSegue) {
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellForMainView
        
        
        cell.mealImage.image = restaurants[indexPath.row].mealImage
        cell.logo.image = restaurants[indexPath.row].logoOfRestaurant
        if restaurants[indexPath.row].discountPromo != nil {
            cell.discountPromo.text = restaurants[indexPath.row].discountPromo
        } else {
            cell.discountPromo.removeFromSuperview()
            cell.promoButten.removeFromSuperview()
        }
        cell.discountPromo.text = restaurants[indexPath.row].discountPromo
        cell.nameOfRestaurant.text = restaurants[indexPath.row].nameOfRestaurant
        cell.typeOfFood.text = restaurants[indexPath.row].TypeOfFood
        cell.estimatetTimeForDelviry.text = restaurants[indexPath.row].estimatedTime
        cell.evaluationStar.text = "\(restaurants[indexPath.row].evaluation)"
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuSander = restaurants[indexPath.row].munuOfRestaurant
        imageOfmeal = restaurants[indexPath.row].mealImage
        performSegue(withIdentifier: "toMenu", sender: self)
    }
  
}
