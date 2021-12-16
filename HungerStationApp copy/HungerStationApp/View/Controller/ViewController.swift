//
//  ViewController.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 10/04/1443 AH.
//

import UIKit
//view controller one

class ViewController: UIViewController {
    @IBOutlet weak var restrauntTabelView: UITableView!
    var restorants: Restorants = Restorants(data: [])
    var idRestruant = 0
    var restorantBackImageSender = ""
    var nameRestruantV1 = ""
    var foodTypeV1 = ""
    var spendRest = ""
    var offerRestV1 = ""
    var sar = 0
    var evel = 0.0
    var minPri = ""
    var deliveryCostV1 = ""
    var deliveryTimeV1 = ""
    var restImageBrand = UIImage(named: "")
    var lolgoMenu =  UIImage(named: "")
    
    let restorantsURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadRestorantData(restorantsURL)
        restrauntTabelView.delegate = self
        restrauntTabelView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toMenu = segue.destination as! MenuRestruantData
        toMenu.restorantsId = idRestruant
        toMenu.restorantBackImage = restorantBackImageSender
        toMenu.restImageV2 = restImageBrand
        toMenu.brandMenuV2 = lolgoMenu
        toMenu.nameRestV2 = nameRestruantV1
        toMenu.typeFoodV2 = foodTypeV1
        toMenu.spendMenu = spendRest
        toMenu.srMenuV2 = deliveryCostV1
        toMenu.evelMwnuV2 = evel
        toMenu.offerLabelV2 = offerRestV1
        toMenu.theDevierytime = deliveryTimeV1
        
        
        
    }
        @IBAction func getBack(segue:UIStoryboardSegue) {
        }
    
    func downloadRestorantData(_ FromURL: String) {
        if let restorantData = URL(string: FromURL) {
            // 2 step
            let urlSession = URLSession(configuration: .default)
            // 3 step use a task
            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let safeData = data {
                        do {
                            //make a decorder to devind jsonDecoder from API network
                            let decorder = JSONDecoder()
                            self.restorants = try decorder.decode(Restorants.self, from: safeData)
                            DispatchQueue.main.async {
                                self.restrauntTabelView.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            //for task step must be write to work
            urlTask.resume()
        }
    }
}

// extention for delegat and data sours
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorants.data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restrauntTabelView.dequeueReusableCell(withIdentifier: "restruantCell") as! TheRestruantCell
        cell.nameOfRestruant.text = restorants.data[indexPath.row].name
        cell.tyoeOfFood.text = restorants.data[indexPath.row].category
        cell.evlationCustomer.text = String(restorants.data[indexPath.row].rating)
        cell.logoImage.image = UIImage(named: restorants.data[indexPath.row].image)
        cell.timerToTake.text = "\(restorants.data[indexPath.row].delivery.time.min)" + "_ \(restorants.data[indexPath.row].delivery.time.max) minutes |"
        cell.deliveryCost.text = "\(restorants.data[indexPath.row].delivery.cost.value)" + " \(restorants.data[indexPath.row].delivery.cost.currency) |"
       
        if restorants.data[indexPath.row].is_promoted {
            cell.promotedLabel.isHidden = false
        }else {
            cell.promotedLabel.isHidden = true
        }
        // this offer it's Optionaml we use a if and nil and make a two thing of offer value and spend in the cell
        
        if restorants.data[indexPath.row].offer != nil {
            let value = restorants.data[indexPath.row].offer?.value
            let spend = restorants.data[indexPath.row].offer?.spend
            cell.offerLabel.text = value! + " (spend \(spend!) SAR)"
        }else {
            cell.offerLabel?.removeFromSuperview()
        }
        if let restorantlogo = URL(string: restorants.data[indexPath.row].resturant_image) {
            DispatchQueue.global().async {
                if let restorantlogo = try? Data(contentsOf: restorantlogo) {
                    let logo = restorantlogo
                    DispatchQueue.main.async {
                        cell.logoImage.image = UIImage(data: logo)
                    }
                }
            }
        }
        if let restorantBackImage = URL(string: restorants.data[indexPath.row].image) {
            DispatchQueue.global().async {
                if let restorantBackImage = try? Data(contentsOf: restorantBackImage) {
                    let backImage = restorantBackImage
                    DispatchQueue.main.async {
                        cell.restrantImage.image = UIImage(data: backImage)
                    }
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let hungerStationImageURl = URL(string: self.restorants.data[indexPath.row].resturant_image),
           let logoImageURl = URL(string: self.restorants.data[indexPath.row].image){
            if let hungerStationImageData = try? Data(contentsOf: hungerStationImageURl),
               let logoStationImageData = try? Data(contentsOf: logoImageURl){
                let hangerImage = UIImage(data: hungerStationImageData)
                let logo = UIImage(data: logoStationImageData)
                lolgoMenu = hangerImage
                restImageBrand = logo
                idRestruant = restorants.data[indexPath.row].id
                foodTypeV1 = restorants.data[indexPath.row].category
                nameRestruantV1 = restorants.data[indexPath.row].name
                evel = restorants.data[indexPath.row].rating
                deliveryTimeV1 = "\(restorants.data[indexPath.row].delivery.time.min)" + "_\(restorants.data[indexPath.row].delivery.time.max) minutes"
                deliveryCostV1 = "\(restorants.data[indexPath.row].delivery.cost.value)" + " \(restorants.data[indexPath.row].delivery.cost.currency)"
             if restorants.data[indexPath.row].offer != nil {
                 let value = restorants.data[indexPath.row].offer?.value
                 let spend = restorants.data[indexPath.row].offer?.spend
                 offerRestV1 = value! + " (spend \(spend!) SAR)"
                 spendRest = "\(restorants.data[indexPath.row].delivery.time.min) SR "
             }
              
                
                performSegue(withIdentifier: "toMenu", sender: self)
            }
        }
    }
}

