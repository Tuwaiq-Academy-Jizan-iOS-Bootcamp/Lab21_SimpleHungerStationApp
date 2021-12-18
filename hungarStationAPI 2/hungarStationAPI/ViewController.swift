//
//  ViewController.swift
//  hungarStationAPI
//
//  Created by Ahlam Ahlam on 08/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    
//    OutLet Conect storyBoard and ViewController
    @IBOutlet weak var headar: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
//araay data 
    var resturants:[Restaurant] = []
    var selctArray:Dataa?
    var selecteMenu:[Menu] = []
    var imageView = ["hungar","hur1","hur5","hungar1"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        downloadRestorantData()
        
        
        
    }
    

 
//    sequ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendData = segue.destination as! ViewControllerTwo
        sendData.selctArray = selctArray
    }

    @IBAction func swipeRight(_ sender: Any) {
        if index < imageView.count - 1 {
            index += 1
        } else {
            index = 0
        }
        headar.image = UIImage(named: imageView[index])
    }

    @IBAction func swipeLeft(_ sender: Any) {
        if index > 0 {
            index -= 1
        } else {
            index = imageView.count - 1
        }
        headar.image = UIImage(named: imageView[index] )
    }
    
    
    
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue){
        print("Unwind to Root View Controller")
    }

    
    var data1:[Dataa] = []

    func downloadRestorantData() {
//        URL STEP1
       let downloadData = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
//        URL Optional buding
        if let restorantData = URL(string: downloadData) {
            let urlSession = URLSession(configuration: .default)

            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                
            
                } else {
                    if let safeData = data {
                        
//                        decoder transalate json convert struct
                        let decorder = JSONDecoder()
                        do {
                            let restorantsInfo = try decorder.decode(Restaurant.self, from: safeData)
                            self.data1 = restorantsInfo.data
                            print(self.data1)
                            DispatchQueue.main.async {
                            self.tableView.reloadData()
                              
    
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
extension ViewController: UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellOne
                DispatchQueue.main.async {
                    cell.logoImage.loadImageUsingCache(with:self.data1 [indexPath.row].resturant_image)
                    cell.imageRestauant.loadImageUsingCache(with: self.data1[indexPath.row].image)
                    cell.nameRestauant.text = self.data1[indexPath.row].name
                    cell.typeRestauant.text = self.data1[indexPath.row].category
                    cell.timeRestauant.text = "\(self.data1[indexPath.row].delivery.time.min)- \(self.data1[indexPath.row].delivery.time.max)"
                    cell.deliveryRestauant.text = "\(self.data1[indexPath.row].delivery.cost.currency) \(self.data1[indexPath.row].delivery.cost.value)"
                    cell.trakingRestauant.text = "\(self.data1[indexPath.row].delivery.time.min) - \(self.data1[indexPath.row].delivery.time.min) minutes"
                    cell.starRestauant.text = "\(self.data1[indexPath.row].rating)"
                if self.data1[indexPath.row].is_promoted == false
                    {

                    cell.promted?.removeFromSuperview()
                }
                    if let offer = self.data1[indexPath.row].offer{
                        cell.labelRestauant.text = "\(offer.value) (\(offer.spend))"
                        
                    }else{
                        
                        cell.labelRestauant.isHidden = true
                        cell.viewRestauant.isHidden = true
                        
                    }
        }
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 250
    }

        
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    selctArray = data1[indexPath.row]
    performSegue(withIdentifier: "goTo2", sender: self)
  
}
}



    
    
    
    
    
    
    
    
    
    
