//
//  MenuViewController.swift
//  NouraLab21
//
//  Created by NoON .. on 10/04/1443 AH.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var logoMenuImage: UIImageView!
    @IBOutlet weak var resturantNameMenuLabe: UILabel!
    @IBOutlet weak var starLabe: UILabel!
    @IBOutlet weak var typeFoodMenuLabe: UILabel!
    @IBOutlet weak var timeMenuLabe: UILabel!
    @IBOutlet weak var minimumPriceLabel: UILabel!
    
    @IBOutlet weak var deliveryChargeMenuLabel: UILabel!
    @IBOutlet weak var menuTableView: UITableView!{
        didSet {
            menuTableView.delegate = self
           menuTableView.dataSource = self
        }
    }
    var selectedHungerstation:Hungerstation?
    var selecteMnue:[Menu]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedHungerstation = selectedHungerstation {
            resturantNameMenuLabe.text = selectedHungerstation.resturantName
            typeFoodMenuLabe.text = selectedHungerstation.typeFood
            timeMenuLabe.text = selectedHungerstation.time
            starLabe.text = selectedHungerstation.starResturant
            deliveryChargeMenuLabel.text = selectedHungerstation.deliveryChrge
            logoMenuImage.image = UIImage(named: selectedHungerstation.logoImage)
            menuImage.image = UIImage(named: selectedHungerstation.resturantImage)
            selecteMnue = selectedHungerstation.menu
            menuTableView.reloadData()
        }
    }
    @IBAction func plusButton(_ sender: Any) {
        
        
    }

}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selecteMnue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMenu = tableView.dequeueReusableCell(withIdentifier:"tocellMenu", for: indexPath) as! ListTableViewCell
        cellMenu.mealNameLabel.text = selecteMnue[indexPath.row].productName
        cellMenu.productPriceLabel.text = selecteMnue[indexPath.row].price
        cellMenu.productImage.image = UIImage(named: selecteMnue[indexPath.row].productImage)
//        selectedHungerstation = selecteMnue.[Menu].tableView
//        menuTableView.reloadData()
      return cellMenu
    }
    func tableView(_ tableView: UITableView, heightForRowAt
    indexPath: IndexPath)
    -> CGFloat {
    return 80
    }
    
}

