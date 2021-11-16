//
//  ViewController.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/04/1443 AH.
//

import UIKit

class RestaurantsViewController: UIViewController {
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var restaurantsTableView: UITableView!
    
    
    var restaurants :[Restaurant] = [Restaurant(restaurantName: "McDonald's", restaurantImage: "mm2", restaurantLogo: "mm1", restaurantOffers: "50% off ", restaurantType: "Fast Food", deliveryTime: "45 : 55", restaurantRating: 4.8, deliveryPrice: "15 RS"),Restaurant(restaurantName: "Herfy", restaurantImage: "hm2", restaurantLogo: "hm1", restaurantOffers: "30 %", restaurantType: "Fast Food", deliveryTime: "40 : 50", restaurantRating: 4.3, deliveryPrice: "10 RS"),Restaurant(restaurantName: "Jawaher Coffee", restaurantImage: "cm2", restaurantLogo: "cm1", restaurantOffers: "100 % discount for Tuwaiq camp ", restaurantType: "Coffee", deliveryTime: "20 : 30", restaurantRating: 5.0, deliveryPrice: "Free")]
    
    
    var selectRestaurant : Restaurant?
    
    
    
    let headerImages = ["h1","h2","h3","h4","h4","h6"]
    
    var imageNumber = 0
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        if imageNumber == 0 {
       imageNumber = 5
        }else{
            imageNumber -= 1
            headerImageView.image = UIImage(named: headerImages[imageNumber])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! MenuForRestaurant
        sender.selectRestaurant = selectRestaurant
    }
    
    @IBAction func unwindViweController(segue:UIStoryboardSegue){
    }
}
extension RestaurantsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellElements
        cell.restaurantNameLabel.text = restaurants[indexPath.row].restaurantName
        cell.restaurantTypeLabel.text = restaurants[indexPath.row].restaurantType
        cell.deliveryPriceLabel.text = restaurants[indexPath.row].deliveryPrice
        cell.deliveryTimeLabel.text = restaurants[indexPath.row].deliveryTime
        cell.restaurantOffersLabel.text = restaurants[indexPath.row].restaurantOffers
        cell.restaurantDisplayImageView.image = UIImage(named: restaurants[indexPath.row].restaurantImage)!
        cell.restaurantLogoImageView.image = UIImage(named: restaurants[indexPath.row].restaurantLogo)!
        cell.restaurantRatingLabel.text = String(restaurants[indexPath.row].restaurantRating)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    /*func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

          let view = UIView()
        
          let headerImage = UIImage(named: "Hungerstation")!
          let headerView = UIImageView(image: headerImage)
          headerView.frame = CGRect(x: 20, y: 35, width: 340, height: 80)
          view.addSubview(headerView)
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
            label.text = "text"
            label.textColor = UIColor.blue
            label.font = UIFont(name:"Helvetica Neue" , size: 17)
            label.frame = CGRect(x: 10, y: 8, width: 200, height: 20)
            view.addSubview(label)
            
        
       
          return view
      }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
     }
     */
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRestaurant = restaurants[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        }
    
    
}
