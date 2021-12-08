//
//  ViewController.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resturantTableView: UITableView!
    @IBOutlet weak var headerImageView1: UIImageView!
    @IBOutlet weak var headerImageView2: UIImageView!
    @IBOutlet weak var headerImageView3: UIImageView!
    @IBOutlet weak var headerImageView4: UIImageView!
//  for image swipe
    var advertisementImages = ["hungerstation1","hangerstation2", "hungerstation3", "hangerstation4"]
    var advertisementImage = 0
    
//    @IBAction func swipeImageView(_ sender: Any) {
//    if advertisementImage <= advertisementImage {
//        if advertisementImage == 0 {
//            headerImageView1.image == UIImage(named: advertisementImages[advertisementImage])
//        }else if advertisementImage == 1 {
//            UIImage(named: advertisementImages[advertisementImage])
//        }else if advertisementImage == 2 {
//            headerImageView1.image == UIImage(named: advertisementImages[advertisementImage])
//        }else{
//            headerImageView1.image == UIImage(named: advertisementImages[advertisementImage])
//        }
//        advertisementImage += 1
//    }
//    }
//
//    @IBAction func swipeImageView2(_ sender: Any) {
//
//    if advertisementImage <= advertisementImage {
//         if advertisementImage == 3 {
//            advertisementImage -= 1
//             UIImage(named: advertisementImages[advertisementImage])
//
//         }else if advertisementImage == 2 {
//             advertisementImage -= 1
//             headerImageView1.image == UIImage(named: advertisementImages[advertisementImage])
//
//         }else if advertisementImage == 1 {
//             advertisementImage -= 1
//             headerImageView1.image == UIImage(named: advertisementImages[advertisementImage])
//
//         }else{
//             headerImageView1.image == UIImage(named: advertisementImages[advertisementImage])
//
//         }
//        }
//    }
//  for segue
    var selectResturant : Resturant?
    
//  data
    var resturants = [
    Resturant(resturantImage: "herfyimage", resturantLogo: "herfylogo", resturantDiscount: "50%", resturantName: "Herfy", resturantType: "Fast Food",  resturantDeliveryTime: "30 - 40 minute", resturantDeliveryPrice: "10 SR", resturantRating: "3"),
    Resturant(resturantImage: "applebees", resturantLogo: "applebeeslogo", resturantDiscount: "10%", resturantName: "Applebees", resturantType: "American Food",  resturantDeliveryTime: "40 - 50", resturantDeliveryPrice: "20 SR", resturantRating: "5"),
    Resturant(resturantImage: "blackdose", resturantLogo: "blackdose-1", resturantDiscount: "15%", resturantName: "Black Dose", resturantType: "Coffe", resturantDeliveryTime: "15 - 30 minute", resturantDeliveryPrice: "20", resturantRating: "4.5")]
       
    
    override func viewDidLoad() {
        
        resturantTableView.dataSource = self
        resturantTableView.delegate = self
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! ViewControllerTwo
        sender.selectResturant = selectResturant
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        
        cell.resturantImageView.image = UIImage(named: resturants[indexPath.row].resturantImage)
        cell.resturantLogoImageView.image = UIImage(named: resturants[indexPath.row].resturantLogo)
        cell.resturantDiscountLabel.text = resturants[indexPath.row].resturantDiscount
        cell.resturantNameLabel.text = resturants[indexPath.row].resturantName
        cell.resturantTypeLabel.text = resturants[indexPath.row].resturantType
        cell.resturantDeliveryTimeLabel.text = resturants[indexPath.row].resturantDeliveryTime
        cell.resturantDeliveryPriceLabel.text = resturants[indexPath.row].resturantDeliveryPrice
        cell.resturantRatingLabel.text = resturants[indexPath.row].resturantRating
        

        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectResturant = resturants[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        var hugerstations = ["hungerstation1", "hangerstation2", "hungerstation3", "hangerstation4"]
    
//        return hugerstations.count
        
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
        
        
//    }

    
    
    
}
//let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
//view.backgroundColor = .systemPink
//let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
//label.text = sectionTitles[section]
//label.textColor = .white
////        label.textAlignment = .center
//view.addSubview(label)
//return view


      
        
  


