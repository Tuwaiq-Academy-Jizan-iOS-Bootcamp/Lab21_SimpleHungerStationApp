//
//  ViewController.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 10/04/1443 AH.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    var newArray = DeliveryFood.restaurant
    
    
    var sendThat = DeliveryFood.restaurant[0].photoFoods
    
    var sendMenu = DeliveryFood.restaurant[0].menuRestaurant
    
    @IBOutlet weak var myTableView: UITableView!
    
    var apples = [DeliveryFood]()
    
    var appleBeesChies = [DeliveryFood]()
    
    var myarrays = [DeliveryFood]()
    
    //var applebees2 = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view.
        
//        apples = [apple]
//
//        appleBeesChies = [appleBees2,apple]
        
        //myarrays = [appleBees2,apple,herfeBurger1,herfeBurger2,macdonlds1,macdonlds2]
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVs = segue.destination as! DetilesViewController
        detailsVs.imageOfView = sendThat
        detailsVs.detilesArray = sendMenu


    }
    
   
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
        //end func count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomViewCell
        
        cell.photoFoodsImageView.image = newArray[indexPath.row].photoFoods
        
        cell.nameRestaurantLabel.text = newArray[indexPath.row].nameRestaurant
       
        cell.restaurantBrandImageView.image = newArray[indexPath.row].restaurantBrandImage
        
        cell.typeOfFoodLabel.text = newArray[indexPath.row].typeOfFood
        
        cell.deliveryOffersLabel.text = newArray[indexPath.row].deliveryOffers
        
        cell.rateTheFoodLabel.text = "\(newArray[indexPath.row].rateTheFood)"
        
        cell.estimatedTimeOfArrivalLabel.text = newArray[indexPath.row].estimatedTimeOfArrival
        //cell.
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        sendThat = DeliveryFood.restaurant[indexPath.row].photoFoods
        
        
        
        
        
        sendMenu = DeliveryFood.restaurant[indexPath.row].menuRestaurant
        performSegue(withIdentifier: "goDetiles", sender: self)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 233
    }
    
}
        









//    var apple = DeliveryFood(nameRestaurant: "apple bees", typeOfFood: "Grills,American", photoFoods: UIImage(named: "chiesceac")!, restaurantBrandImage: UIImage(named: "applebees")!, estimatedTimeOfArrival: "45 - 55 minutes", rateTheFood: 3.5, deliveryOffers: "10real delivery Offers")
//
//    var appleBees2 = DeliveryFood(nameRestaurant: "apple bees", typeOfFood: "Grills,American", photoFoods: UIImage(named: "appleBees2")!, restaurantBrandImage: UIImage(named: "applebees")!, estimatedTimeOfArrival: "45 - 55 minutes", rateTheFood: 4.5, deliveryOffers: "5real delivery Offers")
//
//
//    var herfeBurger1 = DeliveryFood(nameRestaurant: "Herfe", typeOfFood: "Fast,Food", photoFoods: UIImage(named: "bifwithChies")!, restaurantBrandImage: UIImage(named: "herfeEmplem")!, estimatedTimeOfArrival: "30 - 40 minutes", rateTheFood: 4.4, deliveryOffers: "10real delivery Offers")
//
//    var herfeBurger2 = DeliveryFood(nameRestaurant: "Herfe", typeOfFood: "Fast,Food", photoFoods: UIImage(named: "superHerve")!, restaurantBrandImage: UIImage(named: "herfeEmplem")!, estimatedTimeOfArrival: "30 - 40 minutes", rateTheFood: 3.4, deliveryOffers: "10real delivery Offers")
//
//    var macdonlds1 = DeliveryFood(nameRestaurant: "macdonlds", typeOfFood: "Fast,Food", photoFoods: UIImage(named: "grandchaken")!, restaurantBrandImage: UIImage(named: "emplemmack")!, estimatedTimeOfArrival: "20 - 30 minutes", rateTheFood: 3.8, deliveryOffers: "Free delivery Offers")
//
//    var macdonlds2 = DeliveryFood(nameRestaurant: "macdonlds", typeOfFood: "Fast,Food", photoFoods: UIImage(named: "macChiken2")!, restaurantBrandImage: UIImage(named: "emplemmack")!, estimatedTimeOfArrival: "20 - 30 minutes", rateTheFood: 3.8, deliveryOffers: "Free delivery Offers")
    
    //var myarray = [DeliveryFood]()






//        var content = cell.defaultContentConfiguration()
//
//        cell.accessoryType = .disclosureIndicator // button
//
//
//        content.text = myarray[indexPath.row].
//
//        content.secondaryText = myarrayInall[indexPath.section][indexPath.row].colorCar
//
//        /////
//
//
//       // let sizeImage = CGSize(width: 70, height: 70)// size image
//
//        let image = UIImage(named: myarrayInall[indexPath.section][indexPath.row].imageCar)
//        content.image = image
//        content.image = image
//        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
//
//        cell.contentConfiguration = content
//        cell.accessoryType = .disclosureIndicator
//
//
////        content.image = myarrayInall[indexPath.section][indexPath.row].imageCar.preparingThumbnail(of: sizeImage)
////        content.imageProperties.maximumSize = sizeImage
////        content.image = myarrayInall[indexPath.section][indexPath.row].imageCar
//
//
////        if indexPath.section ==  2 {
////            dodge.
////        }
//
//
//        // end add and edit image
//
//
//        cell.contentConfiguration = content // print data in TableView
//
//        //cell.labelNameCar.text = myarray
//
////        cell.imageViewInCell.image = UIImage(named: myarray)
//
//
////        if cell.labelNameCar.text == "charger_Srt" {
////
////            cell.labelColerName.text = dodge.colorCar
////            cell.imageViewInCell.image = dodge.imageCar
////            cell.labelIdnumber.text = dodge.idNumberCar
////
////        }else if cell.labelNameCar.text == "Challenger_Srt"{
////
////            cell.labelColerName.text = challenger.colorCar
////            cell.imageViewInCell.image = challenger.imageCar
////            cell.labelIdnumber.text = challenger.idNumberCar
////
////        }else if cell.labelNameCar.text == "comarozl1"{
////
////            cell.labelColerName.text = comaro.colorCar
////            cell.imageViewInCell.image = comaro.imageCar
////            cell.labelIdnumber.text = comaro.idNumberCar
////
////        }else if cell.labelNameCar.text == "viper"{
////            cell.labelColerName.text = viper.colorCar
////            cell.imageViewInCell.image = viper.imageCar
////            cell.labelIdnumber.text = viper.idNumberCar
////        }else{
////            cell.labelColerName.text = corvete.colorCar
////            cell.imageViewInCell.image = corvete.imageCar
////            cell.labelIdnumber.text = corvete.idNumberCar
//
//
//        //}
//
//        return cell
//
//    }// end func TO
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        nameCC = myarrayInall[indexPath.section][indexPath.row].nemeCar
//        imageCC = myarrayInall[indexPath.section][indexPath.row].imageCar
//        colorCC = myarrayInall[indexPath.section][indexPath.row].idNumberCar
//        performSegue(withIdentifier: "goToViewControler", sender: self)
//    }
//
//
//    // حق الطباعة في الصفحة الثانية عرفنا المتغيرت وعطيناها القيم الي في الكلاس والاراي اضفناها ب الابيند
////    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////        return sectionArray[section]
////    }
//
//
//
//
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//           let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
//        view.backgroundColor =  UIColor(red: 1, green: 1, blue: 0,alpha: 1)
//
//           let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 30))
//
//           lbl.font = UIFont.systemFont(ofSize: 20)
//        lbl.text = "heloo"
//           view.addSubview(lbl)
//           return view
//         }
//
//
//    // print power then last Sections
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section == sectionArray.count - 1 {
//            return "Power"
//        }else{
//            return ""
//        }
//    }
//
//
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////           return 65
////    }
////

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }


//func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//          return 65
//   }
//
//
////    // add 3 Sections
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
