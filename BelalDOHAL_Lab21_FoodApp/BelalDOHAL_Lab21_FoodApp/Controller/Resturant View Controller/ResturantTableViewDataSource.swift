import UIKit
import Foundation
extension ResturantViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restorantsTabelView.dequeueReusableCell(withIdentifier: "cell") as! RestorantCell
        cell.restorantName.text = restorants.data[indexPath.row].name
        if let offer = restorants.data[indexPath.row].offer {
            cell.addSubview(cell.triangleCorner)
            cell.triangleCorner.leftAnchor.constraint(equalTo: cell.priceCondition.rightAnchor).isActive = true
            cell.triangleCorner.topAnchor.constraint(equalTo: cell.priceCondition.topAnchor).isActive = true
            if offer.value.contains("%") {
                    cell.priceCondition.text = "  \(offer.value) Your Order (spend \(offer.spend) SAR)"
                }else {
                    cell.priceCondition.text = "  \(offer.value) (spend \(offer.spend) SAR)"
                }
        }else{
            cell.priceCondition.isHidden = true
        }
        if restorants.data[indexPath.row].is_promoted == true {
            cell.promoted.text = "Promoted"
        }else{
            cell.promoted.isHidden = true
        }
        cell.foodType.text = restorants.data[indexPath.row].category
        cell.raiting.text = "\(restorants.data[indexPath.row].rating)"
        cell.deliveryAndOtherThings.text = " \(restorants.data[indexPath.row].delivery.time.min) - \(restorants.data[indexPath.row].delivery.time.max) minutes | Delivery: \(restorants.data[indexPath.row].delivery.cost.value)\(restorants.data[indexPath.row].delivery.cost.currency) |"
        if let restorantlogo = URL(string: restorants.data[indexPath.row].resturant_image) {
            DispatchQueue.global().async {
                if let restorantlogo = try? Data(contentsOf: restorantlogo) {
                    let logo = restorantlogo
                    DispatchQueue.main.async {
                        cell.logo.image = UIImage(data: logo)
                    }
                }
            }
        }
        if let restorantBackImage = URL(string: restorants.data[indexPath.row].image) {
            DispatchQueue.global().async {
                if let restorantBackImage = try? Data(contentsOf: restorantBackImage) {
                    let backImage = restorantBackImage
                    DispatchQueue.main.async {
                        cell.restorandFoodImage.image = UIImage(data: backImage)
                    }
                }
            }
        }
        cell.logo.layer.masksToBounds = true
        cell.logo.layer.cornerRadius = 10
        cell.promoted.layer.masksToBounds = true
        cell.promoted.layer.cornerRadius = 6
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
                    promotedLabelSender = " \(offer.value) Your Order (spend \(offer.spend) SAR) "
                }else {
                    promotedLabelSender = " \(offer.value) (spend \(offer.spend) SAR) "
                }
            }
        }else {
            promotedLabelSender = ""
        }
        performSegue(withIdentifier: "toMenu", sender: self)
    }
}
