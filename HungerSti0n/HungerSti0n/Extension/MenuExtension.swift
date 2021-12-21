//
//  MenuExtension.swift
//  HungerSti0n
//
//  Created by يوسف جابر المالكي on 11/05/1443 AH.
//
import UIKit
import Foundation
extension MenuViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
extension MenuViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu") as! MenuCell
            cell.MealName.text = restorantMenu.menu[indexPath.row].title
            if let subTitle = restorantMenu.menu[indexPath.row].subtitle {
                cell.MealDescrib.text = subTitle
            }else {
                cell.MealDescrib.isHidden = true
            }
        cell.price.text = "\(restorantMenu.menu[indexPath.row].price.value) \(restorantMenu.menu[indexPath.row].price.currency)"
            if let kalorise = restorantMenu.menu[indexPath.row].calories {
                cell.kcalLable.text = "\(kalorise)"
            }else {
                cell.kcalLable.isHidden = true
                cell.kclImage.isHidden = true
            }
            if let foodImage = URL(string: restorantMenu.menu[indexPath.row].image) {
                DispatchQueue.global().async {
                    if let foodImage = try? Data(contentsOf: foodImage) {
                        let image = foodImage
                        DispatchQueue.main.async {
                            cell.foodImage.image = UIImage(data: image)
                        }
                    }
                }
            }
        cell.backgroundColor = .systemGray6
        return cell
    }
}
