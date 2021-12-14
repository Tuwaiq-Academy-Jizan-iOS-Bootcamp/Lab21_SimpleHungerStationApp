//
//  ViewControllerTwo.swift
//  FatanLab210-HungerStation
//
//  Created by Faten Abdullh salem on 06/05/1443 AH.
//

import UIKit

//import Foundation

class ViewControllerTwo:UIViewController {
  
    
@IBOutlet weak var ImageRestaurantVT: UIImageView!
@IBOutlet weak var LogTwo: UIImageView!
@IBOutlet weak var theOfferVT: UILabel!
@IBOutlet weak var RestaurantNameVT: UILabel!
@IBOutlet weak var MealTypeVT: UILabel!
@IBOutlet weak var EvaluationVT: UILabel!
@IBOutlet weak var DeliveryTimeVT: UILabel!
@IBOutlet weak var DeliveryPriceVT: UILabel!
    
@IBOutlet weak var TableViewTwo: UITableView!
var selectR : RestorantsData?
    
var arrayHS = [MenusData]()
    
override func viewDidLoad() {
    super.viewDidLoad()
    TableViewTwo.delegate = self
    TableViewTwo.dataSource = self
if let selectR  = selectR {
    RestaurantNameVT.text = selectR.name
DeliveryTimeVT.text = "\(selectR.delivery.time.min) : \(selectR.delivery.time.max)"
DeliveryPriceVT.text = "\(selectR.delivery.cost.value)\(selectR.delivery.cost.currency)"
EvaluationVT.text = "\(selectR.rating)"
MealTypeVT.text = selectR.category
    
        
    if let image = URL(string: selectR.image){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: image)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.ImageRestaurantVT.image = image
                        }
                    }
                }
        }
        if let image = URL(string: selectR.resturant_image){
        DispatchQueue.global().async {
        let data = try? Data(contentsOf: image)
        if let data = data {
        let image = UIImage(data: data)
        DispatchQueue.main.async {
            self.LogTwo.image = image
    
        
                               
                        }
                    }
                }
             }
    getData(id: selectR.id)
}
    
    
}
       
       
    
    func getData(id : Int){
        if let baseURL = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)") {
    //    print("is thes colled??")
            // Step2
            let session = URLSession(configuration: .default)
       // Step1


        // Step3
        let task = session.dataTask(with: baseURL) { data, responce, error in
           if let error = error {
             print("ERROR",error.localizedDescription)
                }else{

                if let safeData = data{
                do{
                    
        let decoder = JSONDecoder()
        let decodeData = try decoder.decode(Menus.self, from: safeData)
                    print(decodeData.menu)
                    self.arrayHS = decodeData.menu
        DispatchQueue.main.async {
        self.TableViewTwo.reloadData()
            
                }
                } catch{
                    print("SOMETHING WENT WRONG",error.localizedDescription)
               }
        
              }
        
           
                }
            
        }
            
        task.resume()
        
            }
    }
}
extension ViewControllerTwo:UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return arrayHS.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier:"cellTwo", for: indexPath) as!
    DataTVCellTwo
    return cell

    cell.MealName.text = arrayHS[indexPath.row].title
//    cell.MealDescription.text = arrayHS[indexPath.row].subtitle
    cell.MealPrice.text = "\(arrayHS[indexPath.row].price)"
    
    if let subb = arrayHS[indexPath.row].subtitle {
    cell.MealDescription.text = "\(subb)"
    }else{ cell.MealDescription.isHidden = true
        
    }
    if let calor = arrayHS[indexPath.row].calories {
        cell.Calories.text = "\(calor)"
    }
  //  cell.Calories.text = arrayHS[indexPath.row].
    cell.ImageMeal.image = nil
    if let image = URL(string: arrayHS[indexPath.row].image){
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: image)
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    if tableView.cellForRow(at: indexPath) != nil{
                    cell.ImageMeal.image = image
                }
            }
        }
     }
    
                
                }
            }
}
