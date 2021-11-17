//
//  ViewController.swift
//  SimpleHungerStationApp
//
//  Created by Afrah Omar on 10/04/1443 AH.
//

import UIKit


//    var selectedItem:resturant?

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tabelView: UITableView!
    
    var munes : [Meal] = []
    var selectRestaurant : Restaurant?
    var restaurants :[Restaurant] = [
        Restaurant(nameResturant: "Herfy", resturantType: "Fast Food", resturantRating: "3.8", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "1", resturantLogo: "19", resturantOffers: "50 %",deliveryChargeResturant: ""),
    //     ..................................
        Restaurant(nameResturant: "Applebee's", resturantType: "Grills,American", resturantRating: "3.9", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "2", resturantLogo: "20", resturantOffers: "50 %",deliveryChargeResturant: ""),
    //     ..................................
        Restaurant(nameResturant: "Ocean Basket", resturantType: "Sea Food", resturantRating: "3.9", timeMealPreparation: "40-50 minutes", tracking: "Live Tracking", imageResturant: "3", resturantLogo: "21", resturantOffers: "50 %",deliveryChargeResturant: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tabelView.dataSource = self
        tabelView.delegate = self
        
    }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let sender = segue.destination as! DetailsViewController
      sender.selectRestaurant = selectRestaurant
  }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurants.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tabelView.dequeueReusableCell(withIdentifier: "cell") as! RestaurantsCell
           cell.resturantNameLabel.text = restaurants[indexPath.row].nameResturant
           cell.resturantimage.image = UIImage(named:restaurants[indexPath.row].imageResturant)
           cell.resturantTypeLabel.text = restaurants[indexPath.row].resturantType
           cell.resturantRatinglabel.text = restaurants[indexPath.row].resturantRating
           cell.resturantTimeLabel.text = restaurants[indexPath.row].timeMealPreparation
           cell.resturantTrackingLabel.text = restaurants[indexPath.row].tracking
           cell.resturantOffersLabel.text = restaurants[indexPath.row].resturantOffers
           cell.resturantLogoimg.image =   UIImage(named: restaurants[indexPath.row].resturantLogo)
    
   
   
           return cell
       }
       
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 150
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectRestaurant = restaurants[indexPath.row]
       performSegue(withIdentifier: "VC2", sender: self)
       tableView.deselectRow(at: indexPath, animated: true)
    
       }
}
