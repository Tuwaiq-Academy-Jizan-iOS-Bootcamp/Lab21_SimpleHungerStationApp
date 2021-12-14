//
//  ViewController.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resturantTableView: UITableView!
    @IBOutlet weak var headerImageView1: UIImageView!
    @IBOutlet weak var headerImageView2: UIImageView!
    @IBOutlet weak var headerImageView3: UIImageView!
    @IBOutlet weak var headerImageView4: UIImageView!
    var resturantData = [ResturantData]()
    var selectResturant : ResturantData?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! ViewControllerTwo
        sender.selectResturant = selectResturant
    }
    
    override func viewDidLoad() {
        
    resturantTableView.dataSource = self
    resturantTableView.delegate = self
        getData()
    }
    
    func getData (){
        print("is this work")
        if let url = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants"){
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
                            let decodedData = try decoder.decode(Resturant.self, from: safeData)
                            DispatchQueue.main.async {
                                self.resturantData = decodedData.data
                                self.resturantTableView.reloadData()
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
    
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return resturantData.count
           }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.resturantNameLabel.text = resturantData[indexPath.row].name
        cell.resturantTypeLabel.text = resturantData[indexPath.row].category
        cell.resturantDeliveryTimeLabel.text = "\(resturantData[indexPath.row].delivery.time.min)-  \(resturantData[indexPath.row].delivery.time.max)"
       
        cell.resturantDeliveryPriceLabel.text = "\(resturantData[indexPath.row].delivery.cost.value) \(resturantData[indexPath.row].delivery.cost.currency)"
    
        cell.resturantRatingLabel.text = "\(resturantData[indexPath.row].rating)"

        if resturantData[indexPath.row].offer == nil{
            cell.resturantDiscountLabel.isHidden = true
        }else{
            cell.resturantDiscountLabel.text =
            resturantData[indexPath.row].offer?.value
            "\(resturantData[indexPath.row].offer?.spend)"
        
        }
        cell.resturantPromoted.text = "\(resturantData[indexPath.row].is_promoted)"
        if resturantData[indexPath.row].is_promoted == true {
            cell.resturantPromoted.text = "promoted"
        }else{
            cell.resturantPromoted.isHidden = true
        }
            
        
        if let imageURL = URL(string: resturantData[indexPath.row].image){
           DispatchQueue.global().async {
        if let data = try? Data(contentsOf: imageURL){
           let image = UIImage(data: data)
           DispatchQueue.main.async {
        if tableView.cellForRow(at: indexPath) != nil {
        cell.resturantImageView.image = image
                    }
           }
                }
            }
        }
        if let imageURL2 = URL(string: resturantData[indexPath.row].resturant_image){
            DispatchQueue.global().async {
        if let data = try? Data(contentsOf: imageURL2){
           let image2 = UIImage(data: data)
           DispatchQueue.main.async {
        if tableView.cellForRow(at: indexPath) != nil {
        cell.resturantLogoImageView.image = image2
                            
                        }
                    }
                }
            }
        }

        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectResturant = resturantData[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 350

        }
}

    
    
    
    
    
    

