//
//  ViewController.swift
//  FatanLab210-HungerStation
//
//  Created by Faten Abdullh salem on 06/05/1443 AH.
//

import UIKit
class ViewController: UIViewController {
  // var users = [InfoHungerStation]()
    @IBOutlet weak var TableViewOne: UITableView!
        
    var selectR : RestorantsData?
    
var arrayHS = [RestorantsData]()
override func viewDidLoad() {
    super.viewDidLoad()
    
    TableViewOne.delegate = self
    TableViewOne.dataSource = self
    
  let back = UIBarButtonItem(title: "", style: .plain,
   target: nil, action: nil)
 navigationItem.backBarButtonItem = back
navigationController!.navigationBar.titleTextAttributes = [
    .foregroundColor: UIColor.white,
   ]

    getData()
}

    func getData(){
      if let baseURL = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants") {
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
    let decodeData = try decoder.decode(Restorants.self, from: safeData)
                print(decodeData.data)
                self.arrayHS = decodeData.data
    DispatchQueue.main.async {
    self.TableViewOne.reloadData()
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! ViewControllerTwo
        sender.selectR = selectR 
    }


 @IBAction func backToFrist (sague:UIStoryboardSegue) {
 }

}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return arrayHS.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {

let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! DataTVCell
    
    
    if let offer = arrayHS[indexPath.row].offer {
        let V = arrayHS[indexPath.row].offer?.value
        let s = arrayHS[indexPath.row].offer?.spend
        cell.theOffer.text = "\(V!) (Spend \(s!) SAR)"
    }else{
        cell.theOffer.isHidden = true
    }
        
    
   if let image = URL(string: arrayHS[indexPath.row].image){
       DispatchQueue.global().async {
           let data = try? Data(contentsOf: image)
           if let data = data {
               let image = UIImage(data: data)
               DispatchQueue.main.async {
                   cell.ImageRestaurant.image = image
               }
           }
       }
    }
    if let image = URL(string: arrayHS[indexPath.row].resturant_image){
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: image)
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    cell.LogOne.image = image
                }
            }
        }
     }
    
        cell.RestaurantName.text = arrayHS[indexPath.row].name
        cell.MealType.text = arrayHS[indexPath.row].category
        cell.Evaluation.text = "\(arrayHS[indexPath.row].rating)"
    
      cell.DeliveryTime.text = "\(arrayHS[indexPath.row].delivery.time.min) -  \(arrayHS[indexPath.row].delivery.time.max)"
    
      cell.DeliveryPrice.text = "\(arrayHS[indexPath.row].delivery.cost.value) - \(arrayHS[indexPath.row].delivery.cost.currency)"
    
   
   return cell
        
    
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectR = arrayHS[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath:IndexPath)->CGFloat {
        return 250
    }
}



        
        
        
        
        
        
        

