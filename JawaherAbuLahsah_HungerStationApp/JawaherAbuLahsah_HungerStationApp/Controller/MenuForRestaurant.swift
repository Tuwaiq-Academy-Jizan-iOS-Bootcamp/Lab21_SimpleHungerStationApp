//
//  MenuForRestaurant.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/04/1443 AH.
//

import Foundation
import UIKit
class MenuForRestaurant:UIViewController{
    
    @IBOutlet weak var bottomContraintImage: NSLayoutConstraint!
    @IBOutlet weak var viewInfoRestaurantConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageView: UIImageView!{
        didSet{
            logoImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantRatingLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    @IBOutlet weak var minimumOrderLabel: UILabel!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var deliveryTimeLable: UILabel!
    @IBOutlet weak var restaurantDisplayImage: UIImageView!
    @IBOutlet weak var menuRestaurantTableView: UITableView!
    @IBOutlet weak var restaurantInfoView: UIView!{
        didSet{
            restaurantInfoView.layer.cornerRadius = 10
            restaurantInfoView.layer.shadowColor = UIColor.black.cgColor
            restaurantInfoView.layer.shadowOpacity = 0.5
            restaurantInfoView.layer.shadowOffset = CGSize.zero
            restaurantInfoView.layer.shadowRadius = 5
        }
    }
    
    var menus = Meal(menu: [])
    var selectRestaurant : RestaurantData?
    
    
    override func viewDidLoad() {
        if let meal = selectRestaurant{
            restaurantNameLabel.text = meal.name
            restaurantTypeLabel.text = meal.category
            restaurantRatingLabel.text = "\(meal.rating)"
            deliveryTimeLable.text = "\(meal.delivery.time.min) : \(meal.delivery.time.max)"
            deliveryPriceLabel.text = "\(meal.delivery.cost.value)\(meal.delivery.cost.currency)"
            minimumOrderLabel.text = "\(meal.delivery.cost.value)\(meal.delivery.cost.currency)"
            restaurantDisplayImage.loadImage(meal.image)
            logoImageView.loadImage(meal.resturant_image)
            
            //get data API
            API.shared.getData(endPoint: "restaurants/\(meal.id)") { (menusData:Meal) in
                self.menus = menusData
                DispatchQueue.main.async {
                    self.menuRestaurantTableView.reloadData()
                }
            }
        }
    }
    
    
    //for hidden navigationController
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        navigationController?.setNavigationBarHidden(true, animated: animated)
    //    }
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    
    //compress and expand view
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffSetY =  scrollView.contentOffset.y
        //compress view
        if restaurantInfoView.frame.size.height > 60 {
            if contentOffSetY > 0 {
                viewInfoRestaurantConstraint.constant += contentOffSetY
                if restaurantDisplayImage.frame.size.height > 150 {
                    bottomContraintImage.constant += contentOffSetY
                }
                scrollView.contentOffset.y -= contentOffSetY
           }
        }
        
        //expand view
        if restaurantInfoView.frame.size.height < 150{
            if contentOffSetY < 0 {
                viewInfoRestaurantConstraint.constant += contentOffSetY
                     if restaurantDisplayImage.frame.size.height < 200 {
                    bottomContraintImage.constant += contentOffSetY
                }
                scrollView.contentOffset.y -= contentOffSetY
            }
        }
    }
    
    
}

extension MenuForRestaurant:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as! CellElements
        cell.mealNameLabel.text = menus.menu[indexPath.row].title
        cell.mealPriceLabel.text = "\(menus.menu[indexPath.row].price.value)\(menus.menu[indexPath.row].price.currency)"
        cell.mealImageLabel.loadImage(menus.menu[indexPath.row].image)
        if menus.menu[indexPath.row].subtitle != nil{
            cell.subtitleMeal.text = menus.menu[indexPath.row].subtitle
        }else{
            cell.subtitleMeal.isHidden = true
        }
        if menus.menu[indexPath.row].calories != nil{
            cell.caloriesLabel.text = "\(menus.menu[indexPath.row].calories!)"
        }else{
            cell.caloriesLabel.isHidden = true
            cell.caloriesImage.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
        if let offerValue = selectRestaurant?.offer?.value , let offerSpend = selectRestaurant?.offer?.spend{
            label.text = "\(offerValue) (Spend \(offerSpend)SR)"
            label.textColor = UIColor.systemBackground
            label.frame = CGRect(x: 10, y: 8, width: 365, height: 20)
            label.backgroundColor = .systemBlue
            view.backgroundColor = .systemBackground
            view.addSubview(label)
        }else{
            view.isHidden = true
        }
        return view
    }
}
