//
//  SceneDelegate.swift
//  Nasser_Lab21
//
//  Created by Nasser Aseeri on 10/05/1443 AH.
//



import UIKit
import Foundation
extension MenuController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu") as! MenuCell
            cell.mainText.text = restorantMenu.menu[indexPath.row].title
            if let subTitle = restorantMenu.menu[indexPath.row].subtitle {
                cell.secondaryText.text = subTitle
            }else {
                cell.secondaryText.isHidden = true
            }
            cell.price.text = "\(restorantMenu.menu[indexPath.row].price.value) \(restorantMenu.menu[indexPath.row].price.currency)"
            if let kalorise = restorantMenu.menu[indexPath.row].calories {
                cell.kaloris.text = " \(kalorise) Kcal"
            }else {
                cell.kaloris.isHidden = true
                cell.trashImage.isHidden = true
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
