//
//  ViewControllerTwo.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import Foundation
import UIKit
class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var resturantImageView2: UIImageView!
    @IBOutlet weak var resturantLogoImageView2: UIImageView!
    @IBOutlet weak var resturantNamelabel2: UILabel!
    @IBOutlet weak var resturantRatinglabel2: UILabel!
    @IBOutlet weak var resturantTypeLabel2: UILabel!
    @IBOutlet weak var minumumMealPriceLabel2: UILabel!
    @IBOutlet weak var deliveryPriceLabel2: UILabel!
    @IBOutlet weak var deliveryTimeLabel2: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var resturantDiscountLabel2: UILabel!
    @IBOutlet weak var viewResturantInformation: UIView!
    
    
    var resturantMenu = [Menu]()
    var selectResturant : ResturantData?
    
    override func viewDidLoad() {
        
// ............namvigation bar hidden............
        self.navigationController?.isNavigationBarHidden = true
        
// ............tableview and viewresturant information corner...........
        self.menuTableView.layer.cornerRadius = 5
        self.viewResturantInformation.layer.cornerRadius = 5
        self.resturantDiscountLabel2.layer.cornerRadius = 5
        
// ............menutableview....................................
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
// ............for view resturant information get from viewcontroller one........
    if let resturant = selectResturant {
        resturantImageView2.loadImageUsingCache(with: resturant.image)
        resturantImageView2.layer.cornerRadius = 10
           
        resturantLogoImageView2.loadImageUsingCache(with: resturant.resturant_image)
        resturantLogoImageView2.layer.cornerRadius = 15
           
        resturantNamelabel2.text = resturant.name
        resturantRatinglabel2.text = "\(resturant.rating)"
        resturantTypeLabel2.text = resturant.category
        deliveryPriceLabel2.text = "\(resturant.delivery.cost.value)\(resturant.delivery.cost.currency)"
        deliveryTimeLabel2.text = "\(resturant.delivery.time.min) -\(resturant.delivery.time.max)"
        minumumMealPriceLabel2.text = "\(resturant.delivery.cost.value) \(resturant.delivery.cost.currency)"
           
    if resturant.offer != nil {
        let value = resturant.offer?.value
        let spend = resturant.offer?.spend
        resturantDiscountLabel2.text = value! + " (Spend \(spend!) SAR)"
        }else{
        resturantDiscountLabel2.isHidden = true
           }
           
// ..........call function fitch data....................
        getData(id: resturant.id)

        }
    }
    
// ..........function fitch data...................
    func getData (id:Int){
        print("is this work")
        if let url = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)"){
        print("was the url in correct formate")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, respose, error in
            if let error = error {
                print("error",error.localizedDescription)
            }else{
                print ("do we have data", data)
                if let safeData = data{
                    print (String(data: safeData, encoding: .utf8))
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(MenuData.self, from: safeData)
                        DispatchQueue.main.async {
                            self.resturantMenu = decodedData.menu
                            self.menuTableView.reloadData()
                        }
                        print ("decodeadData", decodedData)
                    }catch{
                        print ("somthing went rong", String(describing: error))
                    }
                }
            }
        }
        task.resume()
    }
}
}

// ......................display data...............................

extension ViewControllerTwo:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return resturantMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.mealNameLabel.text = resturantMenu[indexPath.row].title
        cell.mealDescrptionLabel.text = resturantMenu[indexPath.row].subtitle
        
    if resturantMenu[indexPath.row].calories != nil {
        cell.mealCalorisLabel.text = "\(resturantMenu[indexPath.row].calories!)"
            
    }else{
        cell.mealCalorisLabel.isHidden = true
        cell.framLabel.isHidden = true
        }
        cell.mealPriceLabel.text = "\(resturantMenu[indexPath.row].price.value) \(resturantMenu[indexPath.row].price.currency)"
        
        cell.mealImageView.loadImageUsingCache(with: resturantMenu[indexPath.row].image)
        cell.mealImageView.layer.cornerRadius = 5
        
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        cell.layer.shadowRadius = 8.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.10
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150    }
}




