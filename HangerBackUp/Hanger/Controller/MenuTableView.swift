//
//  MenuTableView.swift
//  Hanger
//
//  Created by Yasir Hakami on 17/11/2021.
//

import Foundation
import UIKit


class MenuTableView: UIViewController {
    
    var menu = HungerStaion.restaurant[0].munuOfRestaurant
    @IBOutlet weak var menuTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
    }
    
}
extension MenuTableView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = menu[indexPath.row].nameOfMeal
        let imageSize = CGSize(width: 60, height: 60)
        content.image = menu[indexPath.row].mealImages
        content.imageProperties.maximumSize = imageSize
        content.secondaryText = "\(menu[indexPath.row].PriceOfMeal) SRA "
        
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}
