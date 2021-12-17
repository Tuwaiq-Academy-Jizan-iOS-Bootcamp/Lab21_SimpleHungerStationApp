//
//  viewControllerTableview.swift
//  Lab21
//
//  Created by زهور حسين on 10/04/1443 AH.
//

import Foundation
import UIKit
//struct menu {
//var mealimage: UIImage
//var mealtitle: String
//var mealprice: String
//
//}


class viewControllerTableview2: UIViewController{
    
    @IBOutlet weak var tableviewTow: UITableView!{
        didSet {
             tableviewTow.delegate = self
            tableviewTow.dataSource = self
        }
    }
@IBOutlet weak var imagetableview2: UIImageView!
    
    @IBOutlet weak var logotableviewTow: UIImageView!
    
    
    @IBOutlet weak var lablemenublue: UIImageView!
    @IBOutlet weak var nameintableview2: UILabel!
    
    @IBOutlet weak var rateninginmenu: UILabel!
    @IBOutlet weak var evaluationtableview2: UILabel!
    
    
    @IBOutlet weak var viewmnue: UIStackView!
    
  //  @IBOutlet weak var deliverytableview2: UILabel!
    
    @IBOutlet weak var priceintableview2: UILabel!
    @IBOutlet weak var timedeliverytableview2: UILabel!
    
    @IBOutlet weak var lableAdvertising: UILabel!

    var hungerStation : [Mnue] = []
   var selectresturent : Resturant?
  
            

    override func viewDidLoad() {
        super.viewDidLoad()
      
   
        viewmnue.layer.cornerRadius = 8
var id = selectresturent?.id
   
    
    if let selectresturentinfo = selectresturent {
                      nameintableview2.text = "\(selectresturentinfo.name)"
                      evaluationtableview2.text = "\(selectresturentinfo.rating)"
                    
        priceintableview2.text = "\(selectresturentinfo.delivery.cost.currency)"
                      timedeliverytableview2.text = "\(selectresturentinfo.delivery.time)"
                      rateninginmenu.text = "\(selectresturentinfo.category)"
       

       
        if let v = selectresturentinfo.offer {
            lableAdvertising.text = "\(v.value ) spend \(v.spend)sar"
        }else{
            lableAdvertising.isHidden = true
            lablemenublue.isHidden = true
        
       
        }
                      
                      if let imageURL = URL(string: selectresturentinfo.resturant_image){
                          DispatchQueue.global().async {
                              let data = try? Data(contentsOf: imageURL)
                              if let data = data {
                                  let img2 = UIImage(data: data)
                                  DispatchQueue.main.async {
                                      
                                      self.logotableviewTow.image = img2
                                  }
                              }
                          }
                      }
                                  if let imageURL = URL(string: selectresturentinfo.image){
                                DispatchQueue.global().async {
                                let data = try? Data(contentsOf: imageURL)
                            if let data = data {
                                    let img5 = UIImage(data: data)
                            DispatchQueue.main.async {
                                                  
                                self.imagetableview2.image = img5
                            }
                            }
                                }
                                  }
                          
                                    
                      getData(with:selectresturentinfo.id)
    }
   
    }

    func getData(with endpoint:Int){
         
     print("Is this called??")
     let baseURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(endpoint)"
     
     if let ur1 = URL(string: baseURL) {
         print("WAS THE IN CORRECT FORMAT")
         
         let session = URLSession(configuration: .default)
         
         let task = session.dataTask(with: ur1) { data, response, error in
             if let error = error {
                 print("ERROR" , error.localizedDescription)
             }else{
               print("DO WE HAVE DATA",data)
                 if let safeData = data {
                     do {
                         let decoder = JSONDecoder()
                         let decodedData = try decoder.decode(Menus.self,from: safeData)
                     
                         DispatchQueue.main.async {
                            
                             self.hungerStation = decodedData.menu
                             self.tableviewTow.reloadData()

                                 }
                             
                       //  print("DECOD DATA", decodedData[0]
                     }catch{
                         print("SOMETHING WENT WRONG",error.localizedDescription)
                     }
                 }
             }
         }
         task.resume()
             }
         }
     }

extension viewControllerTableview2: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return hungerStation.count
}
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cellviewcontrollertow
            cell.namemealincell.text = hungerStation[indexPath.row].title
          //  cell.imageclltableview2.image = hungerStation[indexPath.row].image
           // cell.calureise.text = hungerStation[indexPath.row].calories
            cell.descriptioncalurise.text = hungerStation[indexPath.row].subtitle
            cell.pricemealincell.text = "\(hungerStation[indexPath.row].price.value),\(hungerStation[indexPath.row].price.currency)"
            
            if let imageURL = URL(string: hungerStation[indexPath.row].image){
                DispatchQueue.global().async { [self] in
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                    let img2 = UIImage(data: data)
                    DispatchQueue.main.async {
               
                    cell.imageclltableview2.image = img2
                    }
                    }
                }
                }
                        if hungerStation[indexPath.row].calories != nil {
            let calu = hungerStation[indexPath.row].calories
                      cell.calureise.text = "\(calu)"
                  }else{
                          cell.calureise.removeFromSuperview()
                  }
                     
                    
                return cell
                    
                  }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
                                  
