//
//  ViewController.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 10/04/1443 AH.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    var hungerStationInformation:[RestorantsData] = []
    
    @IBOutlet weak var myTableView: UITableView!
    
    var sendId = 0
    
    var sendMenu = ""
    
    var sendrestaurantBrandImage = UIImage(named: "")
    var sendThat = UIImage(named: "")
    
    var sendNameRestrant = ""
    
    var sendRateFood:Double = 0.0
    
    var sendTypeOfFood = ""
    var sendPriceOfFood =  ""
    var sendpriceDelivery = ""
    
    var sendDeliveryTime = ""
    
    var sendDiscuntLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
        
        
        
        
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        getData(with: "/restaurants")
        
        
        
    }
    @IBAction func unwind(segue:UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVs = segue.destination as! DetilesViewController
        
        detailsVs.imageOfView1 = sendThat
        detailsVs.restrantImageInView1 = sendrestaurantBrandImage
        detailsVs.nameRestrantLabelInView1 = sendNameRestrant
        detailsVs.rateFoodLabelInView1 = sendRateFood
        detailsVs.typeOfFoodLabelInView1 = sendTypeOfFood
        detailsVs.priceOfFoodLabelInView1 = sendPriceOfFood
        detailsVs.priceDeliveryLabelInView1 = sendpriceDelivery
        detailsVs.DeliveryTimeLabelInView1 = sendDeliveryTime
        detailsVs.discountInformationLabel2 = sendDiscuntLabel
        
        
        
    }
    
    func getData(with endPoint:String){
        print("Is this called??")
        let baseURL = "https://hungerstation-api.herokuapp.com/api/v1"
        // 1. create url
        if let url = URL(string: baseURL + endPoint) {
            print("WAS THE URL IN CORRECT FORMAT")
            //2. create a URL Session--------------  (السيشن دايما ثابت في اي -> Api)
            let session = URLSession(configuration: .default)
            //3 create a task ----------------   (و التاسك ثابت في اي  -> Api)
            // task divenatin send data requset and response
            let task = session.dataTask(with: url) { data, response, error in
                /// decoder من هنا
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    
                    
                    if let safeData = data {
                        
                        // print(String(data: safeData, encoding: .utf8))
                        
                        /// ths error handling
                        
                        do {
                            
                            // JSONDecoder() ths is func assast تساعد على ربط السويفت و الجيسون
                            let decoder = JSONDecoder()
                            
                            // decode nedd stracrt.self or [stract].self
                            
                            // ui alwas uptate  min thred solf prbleam error coler Purple الايرور البنفسجي
                            
                            let decodedData = try decoder.decode(HungerStation.self, from: safeData)
                            
                            print("DECODED DATA",decodedData.data[1].id)
                            
                            
                            
                            // aa change value decodedData cuse used out scop and add value in exstantion table view
                            self.hungerStationInformation = decodedData.data
                            
                            // func show in data in min
                            DispatchQueue.main.async {
                                
                                // conected with table view
                                self.myTableView.reloadData()
                                
                            }
                            
                            
                            // a عشان اتاكد من المعلومات انها موجودة وكلو تمام
                            for ele in decodedData.data {
                                print(ele.name)
                                //                            print(ele.level)
                                //                            print(ele.img)
                            }
                            
                        } catch {
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        } //end error handling
                        
                    } //
                    
                    
                } //end else error handling
                
                
            }  // end task
            
            
            //4. start/resume the task
            task.resume()
            
            
        } // end url if
        
        
    } // end func getData
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hungerStationInformation.count
        //end func count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomViewCell
        
        
        
        cell.nameRestaurantLabel.text = hungerStationInformation[indexPath.row].name
        
        
        
        cell.typeOfFoodLabel.text = hungerStationInformation[indexPath.row].category
        
        if hungerStationInformation[indexPath.row].is_promoted == false {
            cell.promotedBtn?.removeFromSuperview()
        }
        
        if hungerStationInformation[indexPath.row].offer != nil{
            let value = hungerStationInformation[indexPath.row].offer?.value
            let spand = hungerStationInformation[indexPath.row].offer?.spend
            
            cell.offersLabel.text = value! + " (spand \(spand!)) SAR"
            
        }else{
            cell.offersLabel?.removeFromSuperview()
            
        }
        
        cell.rateTheFoodLabel.text = "\(hungerStationInformation[indexPath.row].rating)"
        //
        cell.estimatedTimeOfArrivalLabel.text = "\(hungerStationInformation[indexPath.row].delivery.time.min) - " + "\(hungerStationInformation[indexPath.row].delivery.time.max) minutes"
        cell.liveTrackLabel.text = "Delivery:\(hungerStationInformation[indexPath.row].delivery.cost.value)" + "\(hungerStationInformation[indexPath.row].delivery.cost.currency)"
        
        if let hungerStationImageURl = URL(string: self.hungerStationInformation[indexPath.row].image), let hungerStationImageURlBrand = URL(string: self.hungerStationInformation[indexPath.row].resturant_image)
        {
            
            DispatchQueue.global().async {
                if let hungerStationImageData = try? Data(contentsOf: hungerStationImageURl),let hungerStationImageBrandData = try? Data(contentsOf: hungerStationImageURlBrand) {
                    let hangerImage = UIImage(data: hungerStationImageData)
                    let hangerImageBrand = UIImage(data: hungerStationImageBrandData)
                    DispatchQueue.main.async {
                        cell.photoFoodsImageView.image = hangerImage
                        cell.restaurantBrandImageView.image = hangerImageBrand
                        
                        
                    }
                }
            }
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        sendNameRestrant = hungerStationInformation[indexPath.row].name
        sendRateFood = hungerStationInformation[indexPath.row].rating
        sendTypeOfFood = hungerStationInformation[indexPath.row].category
        
        sendpriceDelivery = "\(hungerStationInformation[indexPath.row].delivery.cost.value)" + "\(hungerStationInformation[indexPath.row].delivery.cost.currency)"
        sendDeliveryTime = "\(hungerStationInformation[indexPath.row].delivery.time.min) - " + "\(hungerStationInformation[indexPath.row].delivery.time.max) minutes"
        
        
        if hungerStationInformation[indexPath.row].offer != nil{
            let value = hungerStationInformation[indexPath.row].offer?.value
            let spand = hungerStationInformation[indexPath.row].offer?.spend
            
            sendDiscuntLabel =  value! + "\(spand!)"
        } else {
            sendDiscuntLabel = "no"
        }
        
        
        
        
        if let hungerStationImageURl = URL(string: self.hungerStationInformation[indexPath.row].image), let hungerStationImageURlBrand = URL(string: self.hungerStationInformation[indexPath.row].resturant_image)
        {
            
            
            if let hungerStationImageData = try? Data(contentsOf: hungerStationImageURl),let hungerStationImageBrandData = try? Data(contentsOf: hungerStationImageURlBrand) {
                let hangerImage = UIImage(data: hungerStationImageData)
                let hangerImageBrand = UIImage(data: hungerStationImageBrandData)
                
                
                sendThat = hangerImage
                sendrestaurantBrandImage = hangerImageBrand
                
                performSegue(withIdentifier: "goDetiles", sender: self)
                
                
            }
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 233
    }
    
    
}
