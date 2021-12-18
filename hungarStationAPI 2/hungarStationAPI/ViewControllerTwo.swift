//
//  ViewControllerTwo.swift
//  hungarStationAPI
//
//  Created by Ahlam Ahlam on 08/05/1443 AH.
//

import Foundation
import UIKit

class ViewControllerTwo: UIViewController {
    
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var logoTwo: UIImageView!
    
    @IBOutlet weak var headarTwo: UIView!
    
    @IBOutlet weak var twoRestaurant: UILabel!
    
    @IBOutlet weak var twoStar: UILabel!
    
    @IBOutlet weak var twoType: UILabel!
    
    @IBOutlet weak var minimumTwo: UILabel!
    
    @IBOutlet weak var priceDelivery: UILabel!
    
    @IBOutlet weak var timeDelivery: UILabel!
    
    @IBOutlet weak var twoView: UIView!
    
    @IBOutlet weak var viewLabel: UILabel!
    
    @IBOutlet weak var tableViewTwo: UITableView!{
        didSet{
            tableViewTwo.delegate = self
            tableViewTwo.dataSource = self
        }
    }
    var resturants:[Restaurant] = []
    var selctArray:Dataa?
    var selecteMenu:[Menu] = []


    override func viewDidLoad() {
        super.viewDidLoad()
//     info Api Menu
        if let id = selctArray?.id{
            selected(id: "\(id)")
        }
        
        if let selct = selctArray{
            logoTwo.loadImageUsingCache(with:selct.resturant_image)
            imageFood.loadImageUsingCache(with: selct.image)
            twoStar.text = String(selct.rating)
            twoType.text = selct.category
            minimumTwo.text = "\(selct.delivery.cost.value)SR"
            priceDelivery.text = "\(selct.delivery.cost.value)SR"
            twoRestaurant.text = selct.name
//            timeDelivery.text = "\(selct.delivery.time)"
            timeDelivery.text = "\(selct.delivery.time.min) - \(selct.delivery.time.max)"
            if let offer = selct.offer{
                viewLabel.text = "\(offer.value) (\(offer.spend))"
            }else{
                viewLabel.isHidden = true
                twoView.isHidden = true
            }
         headarTwo.layer.shadowColor = UIColor.black.cgColor
        headarTwo.layer.shadowOpacity = 1
        headarTwo.layer.shadowOffset = .zero
        headarTwo.layer.shadowRadius = 3
            
            
            
            viewLabel.layer.masksToBounds = true
            viewLabel.layer.cornerRadius = 7
        }
          
        
    
}

    func selected(id:String) {
        
        let downloadDataMenu = "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)"
        if let restorantData = URL(string: downloadDataMenu) {
            let urlSession = URLSession(configuration: .default)

            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                } else {
                    if let safeData = data {
                        let decorder = JSONDecoder()
                        do {
                            let restorantsInfo1 = try decorder.decode(Menus.self, from: safeData)
                            self.selecteMenu = restorantsInfo1.menu
                            print(self.selecteMenu)
                            DispatchQueue.main.async {
                                self.tableViewTwo.reloadData()
                            }
                        }catch{
                            print("JSON-URL",error.localizedDescription)
                        }
                    }
                }
    }

        urlTask.resume()
}
}
}
//info menu Cell

extension ViewControllerTwo :UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return selecteMenu.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellgo", for: indexPath) as! TableViewCellTwo
        DispatchQueue.main.async {
            cell.imageProdect.loadImageUsingCache(with: self.selecteMenu[indexPath.row].image)
            cell.nameProdect.text = self.selecteMenu[indexPath.row].title
            cell.priceProdect.text = "\(self.selecteMenu[indexPath.row].price.value)"+" \(self.selecteMenu[indexPath.row].price.currency)"
            cell.foodDescription.text = self.selecteMenu[indexPath.row].subtitle
            
            if let calori = self.selecteMenu[indexPath.row].calories{
                cell.calorieseFood.text = "\(calori)"
                
            }else{
                
                cell.calorieseFood.isHidden = true
                cell.fire.isHidden = true
                
            }
            
        }
            return cell
        }

//    Size Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
        
    }
}
        
