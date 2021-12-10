//
//  ResturantView.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 11/04/1443 AH.
//

import UIKit

class ResturantView: UIViewController {
    
    @IBOutlet weak var menuTibleView: UITableView!
    
    
    @IBOutlet weak var resturantDeliveryTime: UILabel!
    
    @IBOutlet weak var viewInfoAboutResturant: UIView!
    
    @IBOutlet weak var resturantOffer: UILabel!
    
    @IBOutlet weak var resturantMinimum: UILabel!
    @IBOutlet weak var resturantCuisine: UILabel!
    @IBOutlet weak var resturantRating: UILabel!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantLogo: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    
    @IBOutlet weak var resturantDeliveryPrice: UILabel!
    
    var nameSelectedT = ""
    var deliveryTimeSelectedT = ""
    var ratingSelectedT = ""
   
    var cuisineSelectedT = ""
    var offerSelectedT = ""
    var DeliveryPriceSelectedT = ""
    var minimumSelectedT = ""
    var menuSelectedT : [Menu]=[]
   var logoSelectedT = UIImage(named: "herfyLogo")
   var imageSelectedT = UIImage(named: "herfyLogo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInfoAboutResturant.layer.cornerRadius = 0.1 *  viewInfoAboutResturant.bounds.size.height

        viewInfoAboutResturant.layer.masksToBounds = true

        // Do any additional setup after loading the view.
        
        resturantName.text =  nameSelectedT
        resturantDeliveryTime.text =  deliveryTimeSelectedT
       resturantRating.text =  ratingSelectedT
       resturantCuisine.text =  cuisineSelectedT
       resturantOffer.text =  offerSelectedT
        resturantDeliveryPrice.text =  DeliveryPriceSelectedT
         resturantLogo.image =  logoSelectedT
        resturantImage.image =  imageSelectedT
        resturantMinimum.text = minimumSelectedT
        //print(menuSelectedT)
        menuTibleView.delegate =  self
        menuTibleView.dataSource = self
      
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
extension ResturantView: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSelectedT.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toCellMenu", for: indexPath ) as! MenuCell
        cell.mealNameCell.text = menuSelectedT[indexPath.row].mealName
        cell.priceMealCell.text = menuSelectedT[indexPath.row].mealPrice
        cell.imageMenuCell.image = menuSelectedT[indexPath.row].mealImage
       return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
     
    
}
