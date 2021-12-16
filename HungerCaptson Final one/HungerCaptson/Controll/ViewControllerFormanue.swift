//
//  ViewControllerFormanue.swift
//  HungerCaptson
//
//  Created by Yasir Hakami on 09/12/2021.
//

import Foundation
import UIKit


class ViewControllerFormanue:UIViewController {
    var manueArray:[MenusData] = [] // relaod it from the API
    
    @IBOutlet weak var tableViewOFMune: UITableView!
    @IBOutlet weak var resturntImage: UIImageView!
    var resturntImageOfMune = UIImage(named: "")
    @IBOutlet weak var logoResurntImage: UIImageView!
    var logotImageOfMune = UIImage(named: "")
    @IBOutlet weak var nameOfResturnt: UILabel!
    var nameOfResturntFromMune = ""
    @IBOutlet weak var evoulationSrat: UILabel!
    var ratingFromManue = 0.0
    @IBOutlet weak var typeOfFood: UILabel!
    var typeFood = ""
    @IBOutlet weak var minPrice: UILabel!
    var minPr = ""
    @IBOutlet weak var highstPrice: UILabel!
    var costDelivrty = ""
    @IBOutlet weak var deviverTime: UILabel!
    var deviver = ""
    @IBOutlet weak var offer: UILabel!
    var offerData = ""
    
    @IBOutlet weak var holderView: UIView!
    
    @IBOutlet weak var heightOfView: NSLayoutConstraint!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerSize: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOFMune.delegate = self
        tableViewOFMune.dataSource = self
        resturntImage.image = resturntImageOfMune
        logoResurntImage.image = logotImageOfMune
        evoulationSrat.text = "\(ratingFromManue)"
        nameOfResturnt.text = nameOfResturntFromMune
        typeOfFood.text = typeFood
        deviverTime.text = deviver
        highstPrice.text = costDelivrty
        minPrice.text = minPr
        offer.text = offerData
        if offerData == "no offer" {
            offer.removeFromSuperview()
           
        }
        // shadow for view
        holderView.layer.shadowColor = UIColor.black.cgColor
        holderView.layer.shadowOpacity = 1
        holderView.layer.shadowOffset = .zero
        holderView.layer.shadowRadius = 10
        
        // label edges
        offer.layer.masksToBounds = true
        offer.layer.cornerRadius = 7
        // orgnais our call
        switch nameOfResturntFromMune {
        case "Burger Land":
            getUrl("/restaurants/1")
        case "Molten Chocolate":
            getUrl("/restaurants/2")
        case "Applebee's":
            getUrl("/restaurants/3")
        case "Al Bake":
            getUrl("/restaurants/4")
        case "Dunkin Donuts":
            getUrl("/restaurants/5")
        case "Herfy":
            getUrl("/restaurants/6")
        default:
            print("Eroor")
        }
        holderView.layer.masksToBounds = true
        holderView.layer.cornerRadius = 7
    }
    
    func getUrl(_ FromURL: String){
        let url = "https://hungerstation-api.herokuapp.com/api/v1"
        if let restorantData = URL(string: url + FromURL) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodeData = try decoder.decode(Menus.self, from: safeData)
                            self.manueArray = decodeData.menu
                            print("DECODED DATA", self.manueArray)
                            for element in decodeData.menu {
                                print("this is my api",element)
                                
                            }
                            print(decodeData.menu[0].image)
                            
                            
                            DispatchQueue.main.sync {
                                self.tableViewOFMune.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            urlTask.resume()
        }
    }
}


extension ViewControllerFormanue:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOFMune.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath) as! manueTableCell
        cell.mealName.text = manueArray[indexPath.row].title
        cell.mealdetiels.text = manueArray[indexPath.row].subtitle
        cell.mealPrice.text = "\(manueArray[indexPath.row].price.value) " + manueArray[indexPath.row].price.currency
        if manueArray[indexPath.row].calories != nil {
            let cal = manueArray[indexPath.row].calories
            
            cell.mealColories.text = "\(cal!)"
        } else {
            cell.mealColories?.removeFromSuperview()
            cell.calSmpile.removeFromSuperview()
        }
        
        
        // stap for image
        if let mealimgeURL = URL(string: self.manueArray[indexPath.row].image){
            DispatchQueue.global().async {
                if let mealimge = try? Data(contentsOf: mealimgeURL){
                    let image = UIImage(data: mealimge)
                    DispatchQueue.main.async {
                        cell.mealImage.image = image
                        
                        
                        
                        }
                    }
                }
                
            }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    // Scroll View
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newHeight = scrollView.contentOffset.y  
        // View Size
        if heightOfView.constant > 324 {
            heightOfView.constant = 324
        }else if heightOfView.constant < 230 {
            heightOfView.constant = 230
        }
        // Header Height
        if headerHeight.constant > 135 {
            headerHeight.constant = 135
        }else if headerHeight.constant < 80 {
            headerHeight.constant = 80
        }
        // Header Size
        if headerSize.constant > 120 {
            headerSize.constant = 120
        }else if headerSize.constant < 75 {
            headerSize.constant = 75
        }
        // Oborations
        heightOfView.constant -= newHeight
        headerHeight.constant -= newHeight
        headerSize.constant -= newHeight / 2
    }
    
    
    
}
