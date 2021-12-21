//
//  DetailsViewo.swift
//  AMAL JELI_LAB21
//
//  Created by Amal Jeli on 10/04/1443 AH.
//

import Foundation
import UIKit


class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var TableViewDetails: UITableView! {
        didSet{
            
            TableViewDetails.delegate = self
            TableViewDetails.dataSource = self
        }
    }
    
    @IBOutlet weak var imageSelectBackground: UIImageView!
    @IBOutlet weak var imageLogoView: UIImageView!
    @IBOutlet weak var nameOfResturant: UILabel!
    @IBOutlet weak var StarLable: UILabel!
    @IBOutlet weak var classificationResturant: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var viewDiscount: UIView!
    @IBOutlet weak var shadowView: UIView! {
        didSet{
            shadowView.layer.masksToBounds = true
            shadowView.layer.cornerRadius = 8
            
            
            shadowView.layer.shouldRasterize = false
            shadowView.layer.shadowOffset = .zero
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOpacity = 0.1
            shadowView.layer.shadowRadius = 0.5

        }
    }
    
    
    

    var menu:[MenusData] = []
    var select:RestorantsData?

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        shadowView.layer.shadowPath = UIBezierPath(rect: shadowView.bounds).cgPath
//        shadowView.layer.shouldRasterize = true
        
        self.navigationController?.isNavigationBarHidden = true
        
//
        var id = select?.id
        getData(with:"/\(id!)")
        
        if let selectRestaurant = select {
        nameOfResturant.text = selectRestaurant.name
            StarLable.text = "\(selectRestaurant.rating)"
            classificationResturant.text = "\(selectRestaurant.category)"
            priceLabel.text = "\(selectRestaurant.delivery.cost.value),\(selectRestaurant.delivery.cost.currency)"
            if let value = selectRestaurant.offer {

              //  let value = selectRestaurant.offer
    //let spend = selectRestaurant.offer?.spend

                discountLabel.text = " \(value.value) (spend \(value.spend) SAR)"
            }else {
                viewDiscount.isHidden = true
                discountLabel.isHidden = true
            }
                
            if let imageURL = URL(string:selectRestaurant.image){
                DispatchQueue.global().async{
                let datta = try? Data(contentsOf: imageURL)
                    if let datta = datta {
                      let image = UIImage(data: datta)
                             DispatchQueue.main.async {
                                 self.imageSelectBackground.image = image
                             }}
                }}
//
            if let imageURL = URL(string:selectRestaurant.image){
                DispatchQueue.global().async{
                let datta = try? Data(contentsOf: imageURL)
                    if let datta = datta {
                      let image = UIImage(data: datta)
                             DispatchQueue.main.async {
                                 self.imageLogoView.image = image
                             }}
                }}

            
    }
    }
        func getData(with endPoint:String){
            print("Is this called")
            let baseURL = ("https://hungerstation-api.herokuapp.com/api/v1/restaurants/")
        
            // 1. create url
            if let url = URL(string: baseURL + endPoint) {
                print("WAS THE URL IN CORRECT FORMAT")
                //2. create a URL Session
                let session = URLSession(configuration: .default)
                //3 create a task
                // task divenatin send data requset and response
                let task = session.dataTask(with: url) { data, response, error in
                    
                    if let error = error {
                        print("ERROR",error.localizedDescription)
                    }else {
                        print("DO WE HAVE DATA",data)
if let safeData = data {
                        
do {
  let decoder = JSONDecoder()
   let decodedData = try decoder.decode(Menus.self, from: safeData)
    self.menu = decodedData.menu
   DispatchQueue.main.async {
   self.TableViewDetails.reloadData()
                                    
                                }
                                
       } catch {
           print("SOMETHING WENT WRONG", String(describing: error))
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                //4. start/resume the task
                task.resume()
                
                
            }
            
            
        }

}
extension DetailsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let OntherCell = UITableViewCell()
//          return OntherCell
     
   
    let cell = TableViewDetails.dequeueReusableCell(withIdentifier: "OtherCell",for:indexPath) as! MuneViewController

        cell.nameCell.text = menu[indexPath.row].title
        cell.pricCell.text = "\(menu[indexPath.row].price.value),\(menu[indexPath.row].price.currency)"
        cell.subtitleCell.text = menu[indexPath.row].subtitle

        if menu[indexPath.row].calories != nil {
            let cal = menu[indexPath.row].calories
                   
            cell.caloriesCell.text = "\(cal!)"
        
               } else {
//                   cell.caloriesCell.removeFromSuperview()
//                   cell.caloriesLogo.removeFromSuperview()
                   cell.caloriesCell.isHidden = true
                   cell.caloriesLogo.isHidden = true
               }
        if let hungerStationImagemnueURl = URL(string: self.menu[indexPath.row].image)
        {
            
            DispatchQueue.global().async {
                if let hungerStationImage = try? Data(contentsOf: hungerStationImagemnueURl) {
                    let hangerStationImage1 = UIImage(data: hungerStationImage)
                    
                    DispatchQueue.main.async {
                        cell.imageCell.image = hangerStationImage1
                        
                    }
                }
            }
        }
        
        return cell
    }
}


    
  
    


