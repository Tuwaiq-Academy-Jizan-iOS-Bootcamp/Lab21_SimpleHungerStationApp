//
//  ResturantViewController.swift
//  ArwaAlattas_HungerStation
//
//  Created by Arwa Alattas on 09/05/1443 AH.
//

import Foundation
import UIKit
class ResturantViewController:UIViewController{
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantLogo: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantRating: UILabel!
    @IBOutlet weak var offerSpend: UILabel!
    @IBOutlet weak var deliviryCost: UILabel!
    @IBOutlet weak var deliviryTime: UILabel!
    @IBOutlet weak var resturantCatogery: UILabel!
    @IBOutlet weak var resturantOffer: UILabel!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    {
        didSet{
            menuTableView.delegate = self
            menuTableView.dataSource = self
        }
    }
//    dissmis navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBOutlet weak var upDetileView: UIView!
    @IBOutlet weak var detailResturantView: UIView!
    
    var meals:[Menu] = []
    var selectResturant:Dataa?
    override func viewDidLoad() {
        if let endPoint = selectResturant?.id{
            APIManager.shared.getDataMenu(endPoint:"/\(endPoint)") { menu in
                self.meals = menu.menu
                DispatchQueue.main.async {
                    self.menuTableView.reloadData()
                }
            }
            
            detailResturantView.layer.shadowColor = UIColor.gray.cgColor
            detailResturantView.layer.shadowOpacity = 1
            detailResturantView.layer.shadowOffset = .zero
            detailResturantView.layer.shadowRadius = 0
            detailResturantView.layer.shadowPath = UIBezierPath(rect: detailResturantView.bounds).cgPath
            detailResturantView.layer.shouldRasterize = true
            upDetileView.layer.cornerRadius = 25
            
        }
        if let resturant = selectResturant{
            resturantImage.loadImageUsingCache(with: resturant.image)
            resturantLogo.loadImageUsingCache(with: resturant.resturant_image)
            resturantName.text = resturant.name
            resturantRating.text = "\(resturant.rating)"
            offerSpend.text = "\(15)SR"
            deliviryTime.text = "\(resturant.delivery.time.min) - \(resturant.delivery.time.max) minutes"
            deliviryCost.text = "\(5)SR"
            resturantCatogery.text = resturant.category
            if let offer = resturant.offer{
                resturantOffer.text = "\(offer.value)(\(offer.spend)SR)"
            }else{
                resturantOffer.isHidden = true
                offerView.isHidden = true
            
            }
          
        }
    }
    
    
}
extension ResturantViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuView
        cell.MealName.text = self.meals[indexPath.row].title
        cell.mealPrice.text = "\(self.meals[indexPath.row].price.value)\(self.meals[indexPath.row].price.currency)"
        cell.mealImage.loadImageUsingCache(with: self.meals[indexPath.row].image)
        if self.meals[indexPath.row].subtitle != nil{
        cell.mealDescription.text = self.meals[indexPath.row].subtitle
        }else{
            cell.mealDescription.isHidden = true
        }
        if let cal = self.meals[indexPath.row].calories{
                cell.mealCalories.text = "\(cal)"
        }else{
            cell.mealCalories.isHidden = true
            cell.calorieImage.isHidden = true
            
        }
        
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
