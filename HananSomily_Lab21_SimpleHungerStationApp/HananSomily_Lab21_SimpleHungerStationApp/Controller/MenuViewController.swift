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
    @IBOutlet weak var photoResturantImage: UIImageView!
    @IBOutlet weak var logoSellectImage: UIImageView!
    @IBOutlet weak var nameResturantLabel: UILabel!
    @IBOutlet weak var levelResturantLabel: UILabel!
    @IBOutlet weak var descriptionResturantLabel: UILabel!
    @IBOutlet weak var caloresLabel: UILabel!
    @IBOutlet weak var priceDeleveryLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
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
            deliveryTimeLabel.text = item.deleveryTime }
        
            menuSelectHerfy = [MenuResturant(menuPhoto: UIImage(named: "herfy1")!, menuName: "Tortilla", numePrice: "25 SAR"),MenuResturant(menuPhoto: UIImage(named: "herfy2")!, menuName: "ICE", numePrice: "5 SAR"),MenuResturant(menuPhoto: UIImage(named: "herfy3")!, menuName: "Borger", numePrice: "30 SAR")]
            menuSelectAselBorger = [MenuResturant(menuPhoto: UIImage(named: "AB1")!, menuName: "borger chiken", numePrice: "20 SAR"),MenuResturant(menuPhoto: UIImage(named: "AB2")!, menuName: "meet borger", numePrice: "30 SAR"),MenuResturant(menuPhoto: UIImage(named: "AB3")!, menuName: "potetoes ", numePrice: "15 SAR")]
            menuSelectBorgerKing = [MenuResturant(menuPhoto: UIImage(named: "bk1")!, menuName: "chiken borger", numePrice: "23 SAR"),MenuResturant(menuPhoto: UIImage(named: "bk2")!, menuName: "meet ..", numePrice: "18 SAR")]
            
            menuResturantTabelView.delegate = self
            menuResturantTabelView.dataSource = self
            
       
        
}

}

extension MenuViewController:UITableViewDelegate {
    
}
extension MenuViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nameResturantLabel.text == "Asel Borger"{
            return menuSelectAselBorger.count
        }
        if nameResturantLabel.text == "Borger King"{
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
        if nameResturantLabel.text == "Asel Borger"{
            content.text = menuSelectAselBorger[indexPath.row].menuName
        content.secondaryText = menuSelectAselBorger[indexPath.row].numePrice
        var image = menuSelectAselBorger[indexPath.row].menuPhoto
            content.image = image }
        if nameResturantLabel.text == "Borger King"{
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
