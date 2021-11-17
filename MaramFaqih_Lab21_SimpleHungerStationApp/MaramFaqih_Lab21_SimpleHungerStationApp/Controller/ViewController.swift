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
    var DeliveryPriceSelected = ""
    var minimumSelected = ""
    var menuSelected : [Menu] = []
    var logoSelected = UIImage(named: "herfyLogo")
    var imageSelected = UIImage(named: "herfyLogo")
   // resturantsTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        headerImageView.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
        headerImageView.layer.masksToBounds = true
        resturantsTableView.delegate = self
        resturantsTableView.dataSource = self
        headers = ["h1","h2","h3","h4"]
        resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true, deliveryPrice: "5", minimum: "35", menu: [Menu(mealName: "Combo Regular Musahab Large Size", mealImage:  UIImage(named: "herfyMeal1")!, mealPrice: "23"),Menu(mealName: "Musahab Large Size", mealImage:  UIImage(named: "herfyMeal2")!, mealPrice: "20")]))
        resturants.append(Resturant(name: "applebee's", logo: UIImage(named: "applebee'sLogo")!, image:UIImage(named: "applebee'sImage")!, cuisine: "American Food", deliveryTime: "45-55", rating: "3.9", theOffer: "5 SAR Delivery(Spend 35 SAR)", trackingStatus: true, deliveryPrice: "7", minimum: "60", menu: [Menu(mealName: "M", mealImage:  UIImage(named: "herfyImage")!, mealPrice: "23")]))
        resturants.append(Resturant(name: "Herfy", logo: UIImage(named: "herfyLogo")!, image:UIImage(named: "herfyImage")!, cuisine: "Fast Food", deliveryTime: "40-50", rating: "3.8", theOffer: "50.0% Off Your Order (Spend 35 SAR)", trackingStatus: true, deliveryPrice: "10", minimum: "99", menu:[ Menu(mealName: "M", mealImage:  UIImage(named: "herfyImage")!, mealPrice: "23")]))
        resturants.append(Resturant(name: "applebee's", logo: UIImage(named: "applebee'sLogo")!, image:UIImage(named: "applebee'sImage")!, cuisine: "American Food", deliveryTime: "45-55", rating: "3.9", theOffer: "5 SAR Delivery(Spend 35 SAR)", trackingStatus: true, deliveryPrice: "3", minimum: "50", menu:[ Menu(mealName: "M", mealImage:  UIImage(named: "herfyImage")!, mealPrice: "23")]))
      
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
            destintionToDetails.DeliveryPriceSelectedT = DeliveryPriceSelected
            destintionToDetails.minimumSelectedT = minimumSelected

        }
    @IBAction func backToFrist(segue:UIStoryboardSegue){
        
    }
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! ResturntCell
       // cell.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height

        //cell.layer.masksToBounds = true
        tableView.backgroundColor = .systemGray6
      
       cell.nameCell.text = resturants[indexPath.row].name
        cell.deliveryTimeCell.text = resturants[indexPath.row].deliveryTime
        cell.ratingCell.text = resturants[indexPath.row].rating
        cell.cuisineCell.text = resturants[indexPath.row].cuisine
        cell.logoCell.image = resturants[indexPath.row].logo
        cell.imageCell.image = resturants[indexPath.row].image
       
        cell.offerCell.text = resturants[indexPath.row].theOffer
       
        
        cell.deliveryPriceCell.text = resturants[indexPath.row].deliveryPrice
       
        return cell
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        
        return view
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrPath = resturants[indexPath.row]
        nameSelected = arrPath.name
        deliveryTimeSelected = arrPath.deliveryTime
        ratingSelected = arrPath.rating
        cuisineSelected = arrPath.cuisine
        offerSelected = arrPath.theOffer
        logoSelected = arrPath.logo
        imageSelected = arrPath.image
        menuSelected = arrPath.menu
        DeliveryPriceSelected = arrPath.deliveryPrice
        minimumSelected = arrPath.minimum
        performSegue(withIdentifier: "toRestrunt", sender: indexPath)
    }
    
    
}
