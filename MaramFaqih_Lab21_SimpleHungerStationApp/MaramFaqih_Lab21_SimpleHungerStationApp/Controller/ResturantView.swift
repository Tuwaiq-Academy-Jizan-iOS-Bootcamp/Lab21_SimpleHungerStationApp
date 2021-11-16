//
//  ResturantView.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 11/04/1443 AH.
//

import UIKit

class ResturantView: UIViewController {
    
    
    
    @IBOutlet weak var resturantDeliveryTime: UILabel!
    
    
    @IBOutlet weak var resturantOffer: UILabel!
    
    @IBOutlet weak var resturantCuisine: UILabel!
    @IBOutlet weak var resturantRating: UILabel!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantLogo: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    
    var nameSelectedT = ""
    var deliveryTimeSelectedT = ""
    var ratingSelectedT = ""
   
    var cuisineSelectedT = ""
    var offerSelectedT = ""
   var logoSelectedT = UIImage(named: "herfyLogo")
   var imageSelectedT = UIImage(named: "herfyLogo")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resturantName.text =  nameSelectedT
        resturantDeliveryTime.text =  deliveryTimeSelectedT
       resturantRating.text =  ratingSelectedT
       resturantCuisine.text =  cuisineSelectedT
       resturantOffer.text =  offerSelectedT
         resturantLogo.image =  logoSelectedT
        resturantImage.image =  imageSelectedT
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
