//
//  ViewController.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resturantsTableView: UITableView!
    @IBOutlet weak var headerImageView: UIImageView!
    var headers : [String] = []
    var resturants : [Resturant] = []
    
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        headers = ["h1","h2","h3","h4"]
        headerImageView.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
        headerImageView.layer.masksToBounds = true
        resturantsTableView.delegate = self
        resturantsTableView.dataSource = self
        resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true))
        resturants.append(Resturant(name: "applebee's", logo: UIImage(named: "applebee'sLogo")!, image:UIImage(named: "applebee'sImage")!, cuisine: "American Food", deliveryTime: "45-55", rating: "3.9", theOffer: "5 SAR Delivery(Spend 35 SAR)", trackingStatus: true))
        resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true))
        resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true))
    }


    @IBAction func headerTapGestur(_ sender: UITapGestureRecognizer) {
      
    }
    
    @IBAction func headerSwipeGesturRight(_ sender: UISwipeGestureRecognizer) {
        if (index != 0){
            index -= 1
            }else{
                index = headers.count-1
            }
        headerImageView.image=UIImage(named: headers[index])
  
       
    }
    @IBAction func headerSwipeGesturLeft(_ sender: UISwipeGestureRecognizer) {
        if (index != headers.count-1){
            index += 1
            }else{
                index = 0
            }
        headerImageView.image=UIImage(named: headers[index])
     
        
    }
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! ResturntCell
      
  
       cell.nameCell.text = resturants[indexPath.row].name
        cell.deliveryTimeCell.text = resturants[indexPath.row].deliveryTime
        cell.ratingCell.text = resturants[indexPath.row].rating
        cell.cuisineCell.text = resturants[indexPath.row].cuisine
        cell.logoCell.image = resturants[indexPath.row].logo
        cell.imageCell.image = resturants[indexPath.row].image
       
        cell.offerCell.text = resturants[indexPath.row].theOffer
        
        return cell
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
    
    
}
