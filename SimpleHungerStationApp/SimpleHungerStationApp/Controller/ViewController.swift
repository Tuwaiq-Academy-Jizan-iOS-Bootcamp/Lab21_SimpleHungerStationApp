//
//  ViewController.swift
//  SimpleHungerStationApp
//
//  Created by Afrah Omar on 10/04/1443 AH.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var headerImage: UIImageView!
    
    //     var for select
    var selectRestaurant : RestorantsData?
    //     var array for " api "
    var restaurants = [RestorantsData]()
    //    var for swipe
    var headerImageArr = ["images-2","22"]
    var allAmage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.dataSource = self
        tabelView.delegate = self
        
        downloadRestorantData()
        
        //  API
    }
    func downloadRestorantData() {
        // 1. create url
        if let UrlRestorantData = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants") {
            //2. create a URL Session
            let urlSession = URLSession(configuration: .default)
            //3 create a task
            let task = urlSession.dataTask(with: UrlRestorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let restorantsInfo = try decorder.decode(Restorants.self, from: restorantData)
                            print(restorantsInfo.data)
                            self.restaurants = restorantsInfo.data
                            DispatchQueue.main.async {
                                self.tabelView.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            //4. start/resume the task
            task.resume()
        }
    }
    //     func the select from view restauran to view mune
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! DetailsViewController
        sender.selectRestaurant = selectRestaurant
    }
    // Swipe
    @IBAction func swipeImagesView(_ sender: Any) {
        
        if allAmage < headerImageArr.count - 1 {
            allAmage += 1
        }else{
            allAmage = 0
            headerImage.image = UIImage (named: headerImageArr[allAmage])
        }
    }
    @IBAction func liftSwipe(_ sender: Any) {
        if allAmage > 0 {
            allAmage -= 1
        }else{
            allAmage = headerImageArr.count - 1
            headerImage.image = UIImage (named: headerImageArr[allAmage])
        }
    }
}
    // Extension Delegate and Data Source
    extension ViewController: UITableViewDataSource, UITableViewDelegate {
        
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "cell") as! RestaurantsCell
        cell.resturantNameLabel.text = restaurants[indexPath.row].name
        cell.resturantTypeLabel.text = restaurants[indexPath.row].category
        cell.resturantTimeLabel.text = "\(restaurants[indexPath.row].delivery.time)"
        cell.resturantRatinglabel.text = "\(restaurants[indexPath.row].rating)"
        cell.resturantTrackingLabel.text = "Live Tracking"
        cell.resturantTimeLabel.text =  "\(restaurants[indexPath.row].delivery.time.min)-\(restaurants[indexPath.row].delivery.time.min) minutes - \(restaurants[indexPath.row].delivery.cost.value) \(restaurants[indexPath.row].delivery.cost.currency) "
        if restaurants[indexPath.row].offer != nil {
            let value = restaurants[indexPath.row].offer?.value
            let spend = restaurants[indexPath.row].offer?.spend
            cell.resturantOffersLabel.text = value! + " (spend \(spend!) SAR"
            let path = UIBezierPath()
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: cell.resturantOffersLabel.bounds.width+50 , y: 0))
            path.addLine(to: CGPoint(x: cell.resturantOffersLabel.bounds.width , y: 30))
            path.addLine(to: CGPoint(x: 0, y: 30))
            let shape = CAShapeLayer()
            shape.path = path.cgPath
            cell.viewForLabelOffers.layer.mask = shape
            
        }else {
            cell.promtoedLabel? .removeFromSuperview()
            cell.resturantOffersLabel? .removeFromSuperview()
        }
        cell.resturantImage.image = nil
        if let imageView = URL(string: restaurants [indexPath.row].image) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageView)
                if let data = data {
                    let imge0 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil{
                            cell.resturantImage.image = imge0
                        }
                    }
                }
            }
        }
        cell.resturantLogoimg.image = nil
        if let imageView = URL(string: restaurants [indexPath.row].resturant_image){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageView)
                if let data = data {
                    let imge1 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil{
                            cell.resturantLogoimg.image = imge1
                        }
                    }
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRestaurant = restaurants[indexPath.row]
        performSegue(withIdentifier: "VC2", sender: self)
    }
    @IBAction func unwindToRootviewController(segue: UIStoryboardSegue){
        print("Unwind to Root View Controller")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}



