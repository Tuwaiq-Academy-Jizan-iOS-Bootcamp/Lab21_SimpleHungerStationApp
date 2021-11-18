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
    
    @IBOutlet weak var headerImage: UIImageView!
    
//     var for Select from  View1 -> View2
    var selectRestaurant : Restaurant?
    
//    var for swipe
    var headerImageArr = ["22","1",""]
    var allAmage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tabelView.dataSource = self
        tabelView.delegate = self

    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let sender = segue.destination as! DetailsViewController
      sender.selectRestaurant = selectRestaurant
  }
    
    @IBAction func swipeImagesView(_ sender: Any) {
        
        if allAmage == 0 {
            allAmage = 2
        }else{
            allAmage -= 1
            headerImage.image = UIImage (named: headerImageArr[allAmage])
        }
    }
    
    @IBAction func liftSwipe(_ sender: Any) {
        if allAmage == 2 {
            allAmage = 2
        }else{
            allAmage += 1
            headerImage.image = UIImage (named: headerImageArr[allAmage])
        }
    }
    // Extension Delegate and Data Source
    
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
          return 300
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectRestaurant = restaurants[indexPath.row]
       performSegue(withIdentifier: "VC2", sender: self)
       tableView.deselectRow(at: indexPath, animated: true)
    
       }
    @IBAction func unwindToRootviewController(segue: UIStoryboardSegue){
        print("Unwind to Root View Controller")
    }
}


