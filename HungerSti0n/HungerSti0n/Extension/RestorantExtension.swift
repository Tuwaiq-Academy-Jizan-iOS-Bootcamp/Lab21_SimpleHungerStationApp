//
//  Extension.swift
//  HungerSti0n
//
//  Created by يوسف جابر المالكي on 11/05/1443 AH.
//
import UIKit

extension RestorantViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorants.data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = foodTableView.dequeueReusableCell(withIdentifier: "cell") as! RestorantCell
        cell.nameRestorant.text = restorants.data[indexPath.row].name
        if restorants.data[indexPath.row].offer != nil {
            if let offer = restorants.data[indexPath.row].offer {
                if offer.value.contains("%") {
                    cell.offerLable.text = "  \(offer.value) Your Order (spend \(offer.spend) SR)"
                }else {
                    cell.offerLable.text = "  \(offer.value) (spend \(offer.spend) SR)"
                }
            }
        }else{
            cell.offerLable.isHidden = true
        }
        if restorants.data[indexPath.row].is_promoted == true {
            cell.promotedLable.text = "Promoted"
        }else{
            cell.promotedLable.isHidden = true
        }
        cell.fastFoodLable.text = restorants.data[indexPath.row].category
        cell.raitingLable.text = "\(restorants.data[indexPath.row].rating)"
        cell.deleveryLable.text = " \(restorants.data[indexPath.row].delivery.time.min) - \(restorants.data[indexPath.row].delivery.time.max) minutes \(restorants.data[indexPath.row].delivery.cost.value)\(restorants.data[indexPath.row].delivery.cost.currency) |"
        if let restorantlogo = URL(string: restorants.data[indexPath.row].resturant_image) {
            DispatchQueue.global().async {
                if let restorantlogo = try? Data(contentsOf: restorantlogo) {
                    let logo = restorantlogo
                    DispatchQueue.main.async {
                        cell.logoImageRES.image = UIImage(data: logo)
                    }
                }
            }
        }
        if let restorantBackImage = URL(string: restorants.data[indexPath.row].image) {
            DispatchQueue.global().async {
                if let restorantBackImage = try? Data(contentsOf: restorantBackImage) {
                    let backImage = restorantBackImage
                    DispatchQueue.main.async {
                        cell.backGraoundImage.image = UIImage(data: backImage)
                    }
                }
            }
        }
        
        cell.logoImageRES.layer.masksToBounds = true
        cell.logoImageRES.layer.cornerRadius = 10
        cell.promotedLable.layer.masksToBounds = true
        cell.promotedLable.layer.cornerRadius = 6
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idSender = restorants.data[indexPath.row].id
        restorantBackImageSender = restorants.data[indexPath.row].image
        logoSener = restorants.data[indexPath.row].resturant_image
        nameSender = restorants.data[indexPath.row].name
        raitingSender = restorants.data[indexPath.row].rating
        contantSender = restorants.data[indexPath.row].category
        minimumCostSender = restorants.data[indexPath.row].delivery.cost.value
        deliveryCostSender = restorants.data[indexPath.row].delivery.cost.value
        deliveryMinTimeSender = restorants.data[indexPath.row].delivery.time.min
        deliveryMaxTimeSender = restorants.data[indexPath.row].delivery.time.max
        if restorants.data[indexPath.row].offer != nil {
            if let offer = restorants.data[indexPath.row].offer {
                if offer.value.contains("%") {
                    promotedLabelSender = " \(offer.value) Your Order (spend \(offer.spend) SR) "
                }else {
                    promotedLabelSender = " \(offer.value) (spend \(offer.spend) SR) "
                }
            }
        }else {
            promotedLabelSender = ""
        }
        performSegue(withIdentifier: "toMenu", sender: self)
    }
}


