//
//  ResturantView.swift
//  Nasser_aseeriLab21_SimpleHungerStationApp
//
//  Created by Nasser Aseeri on 12/04/1443 AH.
//


import UIKit

class ResturantView: UIViewController {
    
    @IBOutlet weak var menuTibleView: UITableView!
    
    
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
    var menuSelectedT : [Menu]=[]
   var logoSelectedT = UIImage(named: "herfyLogo")
   var imageSelectedT = UIImage(named: "herfyLogo")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resturantName.text = nameSelectedT
        resturantDeliveryTime.text =  deliveryTimeSelectedT
        resturantRating.text =  ratingSelectedT
        resturantCuisine.text =  cuisineSelectedT
        resturantOffer.text =  offerSelectedT
        resturantLogo.image =  logoSelectedT
        resturantImage.image =  imageSelectedT
        print(menuSelectedT)
        menuTibleView.delegate = self
        menuTibleView.dataSource = self
    }
    

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
