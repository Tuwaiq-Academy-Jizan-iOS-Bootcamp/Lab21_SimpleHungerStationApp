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
    
    var nameSelected = ""
    var deliveryTimeSelected = ""
    var ratingSelected = ""
    var cuisineSelected = ""
    var offerSelected = ""
    var menuSelected : [Menu] = []
    var logoSelected = UIImage(named: "herfyLogo")
    var imageSelected = UIImage(named: "herfyLogo")
    
    var index = 0
    
//===========override====================
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        headers = ["nasser1","nasser2","nasser3","nasser4"]
        headerImageView.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
        headerImageView.layer.masksToBounds = true
        resturantsTableView.delegate = self
        resturantsTableView.dataSource = self
    //    resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true, menu: [Menu(mealName: "Combo Regular Musahab Large Size", mealImage:  UIImage(named: "herfyMeal1")!, mealPrice: "23"),Menu(mealName: "Musahab Large Size", mealImage:  UIImage(named: "herfyMeal1")!, mealPrice: "20")]))
        resturants.append(Resturant(name: "applebee's", logo: UIImage(named: "applebee'sLogo")!, image:UIImage(named: "applebee'sImage")!, cuisine: "American Food", deliveryTime: "45-55", rating: "3.9", theOffer: "5 SAR Delivery(Spend 35 SAR)", trackingStatus: true, menu: [Menu(mealName: "M", mealImage:  UIImage(named: "herfyImage")!, mealPrice: "23")]))
        resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true, menu:[ Menu(mealName: "M", mealImage:  UIImage(named: "herfyImage")!, mealPrice: "23")]))
        resturants.append(Resturant(name: "applebee's", logo: UIImage(named: "applebee'sLogo")!, image:UIImage(named: "applebee'sImage")!, cuisine: "American Food", deliveryTime: "45-55", rating: "3.9", theOffer: "5 SAR Delivery(Spend 35 SAR)", trackingStatus: true, menu:[ Menu(mealName: "M", mealImage:  UIImage(named: "herfyImage")!, mealPrice: "23")]))
      
    }

//============== headerTapGestur =======================
    @IBAction func headerTapGestur(_ sender: UITapGestureRecognizer) {
      
    }
//==================== headerSwipeGesturRight ===========
    @IBAction func headerSwipeGesturRight(_ sender: UISwipeGestureRecognizer) {
        if (index != 0){
            index -= 1
            }else{
                index = headers.count-1
            }
        headerImageView.image=UIImage(named: headers[index])
    }
//==================== headerSwipeGesturLeft =============
    @IBAction func headerSwipeGesturLeft(_ sender: UISwipeGestureRecognizer) {
        if (index != headers.count-1){
            index += 1
            }else{
                index = 0
            }
        headerImageView.image=UIImage(named: headers[index])
    }
//================ override func prepare ================
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destintionToDetails = segue.destination as! ResturantView
            destintionToDetails.nameSelectedT =  nameSelected
            destintionToDetails.deliveryTimeSelectedT =  deliveryTimeSelected
            destintionToDetails.ratingSelectedT =  ratingSelected
            destintionToDetails.cuisineSelectedT =  cuisineSelected
            destintionToDetails.offerSelectedT =  offerSelected
            destintionToDetails.logoSelectedT =  logoSelected
            destintionToDetails.imageSelectedT =  imageSelected
            destintionToDetails.menuSelectedT =  menuSelected

        }
    
}
//============== extension ViewController ============
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = resturants[indexPath.row]
        nameSelected = cell.name
        deliveryTimeSelected = cell.deliveryTime
        ratingSelected = cell.rating
        cuisineSelected = cell.cuisine
        offerSelected = cell.theOffer
        logoSelected = cell.logo
        imageSelected = cell.image
        menuSelected = cell.menu
        performSegue(withIdentifier: "toRestrunt", sender: indexPath)
    }
    
    
}
