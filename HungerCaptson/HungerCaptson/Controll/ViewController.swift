//
//  ViewController.swift
//  HungerCaptson
//
//  Created by Yasir Hakami on 09/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var hungerstaionArray:[RestorantsData] = []
    var images = UIImage(named: "")
    var imagesBrand = UIImage(named: "")
    var rating = 0.0
    var nameOfRes = ""
    var getogery = ""
    var Dtime = ""
    var delivryCost = ""
    var minPrice = ""
    var offerOfresturant = ""
    @IBOutlet weak var tabelViewResturant: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabelViewResturant.delegate = self
        tabelViewResturant.dataSource = self
        getUrl("https://hungerstation-api.herokuapp.com/api/v1/restaurants")
    }
    
    @IBAction func unwind(segue:UIStoryboardSegue) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewControllerFormanue
        vc.resturntImageOfMune = images
        vc.logotImageOfMune = imagesBrand
        vc.ratingFromManue = rating
        vc.nameOfResturntFromMune = nameOfRes
        vc.typeFood = getogery
        vc.deviver = Dtime
        vc.costDelivrty = delivryCost
        vc.minPr = minPrice
        vc.offerData = offerOfresturant
    }
    func getUrl(_ FromURL: String){
        if let restorantData = URL(string: FromURL) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodeData = try decoder.decode(Restorants.self, from: safeData)
                            self.hungerstaionArray = decodeData.data
                            print("DECODED DATA", self.hungerstaionArray)
                            for element in decodeData.data {
                                print(element.id)
                                
                            }
                            print(decodeData.data[0].resturant_image)
                            
                            
                            DispatchQueue.main.sync {
                                self.tabelViewResturant.reloadData()
                                
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





extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hungerstaionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelViewResturant.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellForResturnt
        cell.resturntName.text = hungerstaionArray[indexPath.row].name
        cell.foodTaype.text = hungerstaionArray[indexPath.row].category
        cell.eveloutionStar.text = "\(hungerstaionArray[indexPath.row].rating)"
        cell.delviryTime.text = "\(hungerstaionArray[indexPath.row].delivery.time.min) " + "- \(hungerstaionArray[indexPath.row].delivery.time.max) minutes  |"
        cell.delviryCost.text = "Delivery: \(hungerstaionArray[indexPath.row].delivery.cost.value)" + "\(hungerstaionArray[indexPath.row].delivery.cost.currency)"
        
        if hungerstaionArray[indexPath.row].is_promoted {
            cell.promtoed.isHidden = false
        } else {
            cell.promtoed.isHidden = true
        }
        
        if hungerstaionArray[indexPath.row].offer != nil {
            let value = hungerstaionArray[indexPath.row].offer?.value
            let spend = hungerstaionArray[indexPath.row].offer?.spend
            
            cell.offer?.text = "   " + value! + " (spend \(spend!) SAR)           "
        } else {
            cell.offer?.removeFromSuperview()
        }
        
        
        
        // stap for the image
        if let hungerStationImageURl = URL(string: self.hungerstaionArray[indexPath.row].resturant_image),
           let logoImageURl = URL(string: self.hungerstaionArray[indexPath.row].image){
            DispatchQueue.global().async {
                if let hungerStationImageData = try? Data(contentsOf: hungerStationImageURl),
                   let logoStationImageData = try? Data(contentsOf: logoImageURl){
                    let hangerImage = UIImage(data: hungerStationImageData)
                    let logo = UIImage(data: logoStationImageData)
                    DispatchQueue.main.async {
                        cell.resturntImage.image = logo
                        cell.resturnLogo.image = hangerImage
                        
                        
                    }
                }
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let hungerStationImageURl = URL(string: self.hungerstaionArray[indexPath.row].resturant_image),
           let logoImageURl = URL(string: self.hungerstaionArray[indexPath.row].image){
            if let hungerStationImageData = try? Data(contentsOf: hungerStationImageURl),
               let logoStationImageData = try? Data(contentsOf: logoImageURl){
                let hangerImage = UIImage(data: hungerStationImageData)
                let logo = UIImage(data: logoStationImageData)
                images = logo
                imagesBrand = hangerImage
                rating = hungerstaionArray[indexPath.row].rating
                nameOfRes = hungerstaionArray[indexPath.row].name
                getogery = hungerstaionArray[indexPath.row].category
                Dtime = "\(hungerstaionArray[indexPath.row].delivery.time.min) " + "- \(hungerstaionArray[indexPath.row].delivery.time.max) minutes"
                delivryCost = "\(hungerstaionArray[indexPath.row].delivery.cost.value)" + "\(hungerstaionArray[indexPath.row].delivery.cost.currency)"
                minPrice = "\(hungerstaionArray[indexPath.row].delivery.time.min) SR"
                if hungerstaionArray[indexPath.row].offer != nil {
                    let value = hungerstaionArray[indexPath.row].offer?.value
                    let spend = hungerstaionArray[indexPath.row].offer?.spend
                    
                    offerOfresturant = "        " + value! + " (spend \(spend!) SAR)"
                }else {
                    offerOfresturant = "no offer"
                }
                performSegue(withIdentifier: "toMnue", sender: self)
                
            }
            
        }
    }
    
}
