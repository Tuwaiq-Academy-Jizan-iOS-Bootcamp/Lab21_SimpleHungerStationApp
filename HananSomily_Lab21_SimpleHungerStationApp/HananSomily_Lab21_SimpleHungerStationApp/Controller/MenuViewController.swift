//
//  menuViewController.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 16/11/2021.
//

import Foundation
import UIKit
struct MenuResturant {
    var menuPhoto : UIImage
    var menuName : String
    var numePrice : String
}

class MenuViewController:UIViewController {
    
    @IBAction func ExitBotton(_ sender: UIButton) {
       // exit(2)
    }
    @IBOutlet weak var photoResturantImage: UIImageView!
    @IBOutlet weak var logoSellectImage: UIImageView!
    @IBOutlet weak var nameResturantLabel: UILabel!
    @IBOutlet weak var levelResturantLabel: UILabel!
    @IBOutlet weak var descriptionResturantLabel: UILabel!
    @IBOutlet weak var caloresLabel: UILabel!
    @IBOutlet weak var priceDeleveryLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    
    @IBOutlet weak var detelsOffers: UILabel!
    @IBOutlet weak var menuResturantTabelView: UITableView!
    var selected:HungerStationItem?
    var menuSelectHerfy:[MenuResturant] = []
    var menuSelectAselBorger:[MenuResturant] = []
    var menuSelectBorgerKing:[MenuResturant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = selected{
            photoResturantImage.image = item.image
            logoSellectImage.image = item.logo
            nameResturantLabel.text = item.name
            levelResturantLabel.text = item.evalution
            descriptionResturantLabel.text = item.discription
            deliveryTimeLabel.text = item.deleveryTime
            caloresLabel.text = item.price
            detelsOffers.text = item.detels
        }
        
            menuSelectHerfy = [MenuResturant(menuPhoto: UIImage(named: "herfy1")!, menuName: "BBQ Chicken Tortilla", numePrice: "25 SAR"),MenuResturant(menuPhoto: UIImage(named: "herfy2")!, menuName: "ICE Cream", numePrice: "5 SAR"),MenuResturant(menuPhoto: UIImage(named: "herfy3")!, menuName: "Super Herfy Combo", numePrice: "30 SAR")]
            menuSelectAselBorger = [MenuResturant(menuPhoto: UIImage(named: "AB1")!, menuName: "Jucy burger ", numePrice: "20 SAR"),MenuResturant(menuPhoto: UIImage(named: "AB2")!, menuName: "Origin burger meat", numePrice: "30 SAR"),MenuResturant(menuPhoto: UIImage(named: "AB3")!, menuName: "Cheese Potato ", numePrice: "15 SAR")]
            menuSelectBorgerKing = [MenuResturant(menuPhoto: UIImage(named: "bk1")!, menuName: "X-TRA long chicken", numePrice: "23 SAR"),MenuResturant(menuPhoto: UIImage(named: "bk2")!, menuName: "Humburger", numePrice: "18 SAR")]
            
            menuResturantTabelView.delegate = self
            menuResturantTabelView.dataSource = self
            
       
        
}

}

extension MenuViewController:UITableViewDelegate {
    
}
extension MenuViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nameResturantLabel.text == "The Burger's Origin "{
            return menuSelectAselBorger.count
        }
        if nameResturantLabel.text == "Burger King"{
            return menuSelectBorgerKing.count
        }

        return menuSelectHerfy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath )
        //StructureHungerStation
        var content = cell.defaultContentConfiguration()

        if nameResturantLabel.text == "Herfy"{
       
            content.text = menuSelectHerfy[indexPath.row].menuName
        content.secondaryText = menuSelectHerfy[indexPath.row].numePrice
        var image = menuSelectHerfy[indexPath.row].menuPhoto
            content.image = image }
        //
        if nameResturantLabel.text == "The Burger's Origin "{
            content.text = menuSelectAselBorger[indexPath.row].menuName
        content.secondaryText = menuSelectAselBorger[indexPath.row].numePrice
        var image = menuSelectAselBorger[indexPath.row].menuPhoto
            content.image = image }
        if nameResturantLabel.text == "Burger King"{
            content.text = menuSelectBorgerKing[indexPath.row].menuName
        content.secondaryText = menuSelectBorgerKing[indexPath.row].numePrice
        var image = menuSelectBorgerKing[indexPath.row].menuPhoto
            content.image = image }
        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
    
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}
