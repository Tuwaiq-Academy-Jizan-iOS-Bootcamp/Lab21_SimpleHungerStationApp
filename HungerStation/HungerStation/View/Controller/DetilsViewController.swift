//
//  DetilsViewController.swift
//  HungerStation
//
//  Created by layla hakami on 10/04/1443 AH.
//

import Foundation
import UIKit
class DetilsViweController:UIViewController{
    
    @IBOutlet weak var tableViewMenue: UITableView!{
        didSet{
            tableViewMenue.delegate = self
            tableViewMenue.dataSource = self
        }
    }
    
    @IBOutlet weak var menueImage: UIImageView!
    @IBOutlet weak var logoMenueImage: UIImageView!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var nameMenue: UILabel!
    @IBOutlet weak var starMenue: UILabel!
    @IBOutlet weak var typeFoodMenue: UILabel!
    @IBOutlet weak var menimumMenue: UILabel!
    @IBOutlet weak var restrentDelivaryMenue: UILabel!
    @IBOutlet weak var timeRestrentMenue: UILabel!
  

    
var menueHerfy:[Menue] = []
    
var tortilla = Menue(price: "25", nameMenu: "tortilla", menueimage: "imageTortilla" )
var chickenBurger = Menue(price: "30", nameMenu: "chickenBurger", menueimage: "imageBurger")
var fishBurger = Menue(price: "20", nameMenu: "fishBurger", menueimage: "imageFishBurger")
    
var menueOcaenBasket:[Menue] = []
    
var prawn = Menue(price: "36", nameMenu: "prawn", menueimage: "imagePrawn")
var salmon = Menue(price: "salmon", nameMenu: "salmon", menueimage: "imageSalmon")
var shrimpSalad = Menue(price: "28", nameMenu: "shrimpSalad", menueimage: "imagesalad")
    
var menueApplebees:[Menue] = []
    
var chicenTenders = Menue(price:"40", nameMenu:"chicenTenders", menueimage: "imageChicenTenders")
var chickenSherimp = Menue(price:"70", nameMenu:"chickenSherimp", menueimage: "imageChicken&Sherimp")
var pasta = Menue(price:"54", nameMenu:"pasta", menueimage:"imagepasta")
    
    


var menueArr:[Menue] = [ ]
    
var selectMenue:Restrent?
    
override func viewDidLoad() {
 
    menueHerfy.append(tortilla)
    menueHerfy.append(chickenBurger)
    menueHerfy.append(fishBurger)
    
    
    menueOcaenBasket.append(prawn)
    menueOcaenBasket.append(salmon)
    menueOcaenBasket.append(shrimpSalad)
    
    menueApplebees.append(chicenTenders)
    menueApplebees.append(chickenSherimp)
    menueApplebees.append(pasta)
    
    if let hungerStaion = selectMenue {
        
        nameMenue.text = hungerStaion.name
        menueImage.image = UIImage(named: hungerStaion.image)
        logoMenueImage.image = UIImage(named: hungerStaion.logo)
        starMenue.text = hungerStaion.star
        typeFoodMenue.text = hungerStaion.typefood
        restrentDelivaryMenue.text = hungerStaion.timeDilevary
        timeRestrentMenue.text = hungerStaion.track
        
    }
    if nameMenue.text == "Herfy" {
       menueArr = menueHerfy
        
    }else if  nameMenue.text == "Applebees" {
        
        menueArr = menueApplebees
        
    }else{
        
        menueArr = menueOcaenBasket
    }
        
    
    
}
}
extension DetilsViweController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menueArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menueCell", for: indexPath) as! DetileTableViewCellSecend
        cell.mealImage.image = UIImage(named: menueArr[indexPath.row].menueimage)
        cell.mealName.text = menueArr[indexPath.row].nameMenu
        cell.mealprice.text = menueArr[indexPath.row].price
        
        return cell
    }

}



