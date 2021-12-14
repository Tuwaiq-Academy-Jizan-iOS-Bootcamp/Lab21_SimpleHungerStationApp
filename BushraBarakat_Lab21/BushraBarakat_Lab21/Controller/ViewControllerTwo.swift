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

    var resturantMenu = [Menu]()

    var selectResturant : ResturantData?
    override func viewDidLoad() {
        menuTableView.delegate = self
        menuTableView.dataSource = self
 

       if let resturant = selectResturant {
           resturantImageView2.loadImageUsingCache(with: resturant.image)
           resturantLogoImageView2.loadImageUsingCache(with: resturant.resturant_image)
           resturantNamelabel2.text = resturant.name
           resturantRatinglabel2.text = "\(resturant.rating)"
           resturantTypeLabel2.text = resturant.category
           deliveryPriceLabel2.text = "\(resturant.delivery.cost.value)\(resturant.delivery.cost.currency)"
           deliveryTimeLabel2.text = "\(resturant.delivery.time.min) -\(resturant.delivery.time.max)"
           minumumMealPriceLabel2.text = "\(resturant.delivery.cost.value) \(resturant.delivery.cost.currency)"
           resturantDiscountLabel2.text = resturant.offer?.value
           resturantDiscountLabel2.text = "\(resturant.offer?.spend)"
           if resturant.offer == nil{
            resturantDiscountLabel2.isHidden = true
           }else{
            resturantDiscountLabel2.text =
            resturant.offer?.value
            "\(resturant.offer?.spend)"
           
           }
           
           getData(id: resturant.id)

        }
    }

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
//    
//
//
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

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150    }
}




