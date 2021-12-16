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
    @IBOutlet weak var generalImage: UIImageView!
    var imageOfresturant = UIImage(named: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        generalImage.image = imageOfresturant
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
        let imageSize = CGSize(width: 90, height: 90)
        content.image = menu[indexPath.row].mealImages
        content.imageProperties.maximumSize = imageSize
        content.imageProperties.cornerRadius = .nan
        content.secondaryText = "\(menu[indexPath.row].PriceOfMeal) SRA "
        
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}
