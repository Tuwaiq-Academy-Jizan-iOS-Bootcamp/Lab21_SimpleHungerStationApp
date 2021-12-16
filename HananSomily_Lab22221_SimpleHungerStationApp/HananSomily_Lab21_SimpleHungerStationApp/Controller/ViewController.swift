//
//  ViewController.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//

import UIKit
import Foundation
import CoreLocation
class ViewController: UIViewController , CLLocationManagerDelegate {
   
    @IBOutlet weak var nameOfCity: UILabel!
      var locationCity:CLLocationManager!
    @IBOutlet weak var collectonImageView: UICollectionView! {
        didSet{
            collectonImageView.delegate = self
            collectonImageView.dataSource = self
        }
    }
    var i = 0
    var resturant:[DataAPI] = []
    var select :DataAPI?
    @IBOutlet weak var hungerStationTableView: UITableView! {
        didSet {
            hungerStationTableView.delegate = self
            hungerStationTableView.dataSource = self
        }
    }
    var foodHungerStation:[DataAPI] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // cerent location
        locationCity = CLLocationManager()
        locationCity.delegate = self
        getDtaaAPI(with: "/restaurants")
  
        locationCity.desiredAccuracy = kCLLocationAccuracyBest
        locationCity.requestAlwaysAuthorization()
    if CLLocationManager.locationServicesEnabled() {
        print("location enp")
        locationCity.startUpdatingLocation()
    }
    else {
        print("not found")
        
    }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let cerentLocation = locations[0] as CLLocation
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(cerentLocation) { placemarks, error in
            if (error != nil){
                print("error")
            }
            let placemark = placemarks! as [CLPlacemark]
            if (placemark.count>0){
                let place = placemarks![0]
                let locality = place.locality ?? ""
                let area = place.administrativeArea ?? ""
                let country = place.country ?? ""
                print("locality **** \(locations)")
                print("area \(area)")
                print("country\(country)")
                self.nameOfCity.text = "\(country) , \(locality)"
            }
        }
    }
   // }
    // API get Data
    func getDtaaAPI(with endpoint:String){
    let link = "https://hungerstation-api.herokuapp.com/api/v1"
        print(link)
        if let url = URL(string: link + endpoint){
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error",error.localizedDescription)
                }else {
                    print("we have data",data)
                    if let safeData = data{
                        do{
                        let decoder = JSONDecoder()
let decodedData = try decoder.decode(HungerStationAPI.self, from: safeData)
                            DispatchQueue.main.async {
                self.foodHungerStation = decodedData.data
                self.hungerStationTableView.reloadData()
                                self.resturant = decodedData.data
                                self.collectonImageView.reloadData()
                            }
                        print("decoded data", decodedData)
                    }catch {
                      }
                   }
                }
            }
            task.resume()
    }
    }
    // segue send data between view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let send = segue.destination as! MenuViewController
         send.selected = select
        }
    
    // exit button
    @IBAction func backTo(segue:UIStoryboardSegue){
        
    }
}

extension ViewController :UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodHungerStation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! ClassHungerStationTableView

 let content = foodHungerStation[indexPath.row]
        cell.viewDetelCell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.viewDetelCell.layer.shadowRadius = 7
        cell.viewDetelCell.layer.shadowOpacity = 0.2
        cell.viewDetelCell.layer.shadowColor = UIColor.black.cgColor
        cell.viewDetelCell.layer.masksToBounds = false

        cell.backgroundView?.layer.cornerRadius = 5
        cell.backgroundView?.clipsToBounds = true
        
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale

 cell.nameMealLabel.text = content.name
 cell.descriptionMealLabel.text = content.category
 cell.deliverCostLabel.text = "Delivery: \(content.delivery.cost.value)\(content.delivery.cost.currency)"
 cell.deliveryTimeLabel.text = "\(content.delivery.time.max) - \(content.delivery.time.min) Minutes"
    cell.evaluationLabel.text = "\(content.rating)"
        
if let value = content.offer  {
    cell.offerLabel.text = "\(value.value)(Spend \(value.spend) SAR)"
    cell.offerLabel.sizeToFit()
    print(cell.offerLabel.bounds.width)
    
    let path = UIBezierPath()
    path.move(to: .zero)
    path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width+50 , y: 0))
    path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width, y: 30))
    path.addLine(to: CGPoint(x: 0, y: 30))

    let shape = CAShapeLayer()
    shape.path = path.cgPath

    cell.offerViewShape.layer.mask = shape
    
} else {
    cell.offerLabel.isHidden = true
    cell.offerViewShape.isHidden = true
}
        
let resturantImage = URL(string:foodHungerStation[indexPath.row].image)
     // print(resturantImage)
    if let resturantImage = resturantImage {
          DispatchQueue.global().async {
              if let data = try? Data(contentsOf: resturantImage) {
                  DispatchQueue.main.async {
                      if self.hungerStationTableView.cellForRow(at: indexPath) != nil {
                          cell.imageMeal.image = UIImage(data: data)
                      }
                   }
                }
             }
          }
//        content.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        if let resturantLogoImage = URL(string:foodHungerStation[indexPath.row].resturant_image){
            print(resturantLogoImage)
                DispatchQueue.global().async {
           let data = try? Data(contentsOf: resturantLogoImage)
           if let data = data {
               let image = UIImage(data: data)
               DispatchQueue.main.async {
                   cell.logoImage.image = image
                   
               }
             }
           }
         }
        if content.is_promoted == true {
            cell.promotedLable.text = "Promoted"

        } else {
            cell.promotedLable.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        select = foodHungerStation[indexPath.row]
        performSegue(withIdentifier: "sender", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
        
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
        {
            let verticalPadding: CGFloat = 10
            let maskLayer = CALayer()
            maskLayer.cornerRadius = 20
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 5 , dy: verticalPadding/2)
            cell.layer.mask = maskLayer
        }
     }

extension ViewController:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return resturant.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgeView", for: indexPath) as! ImageViewCell
        if let resturantLogoImage = URL(string:foodHungerStation[indexPath.row].image){
            print(resturantLogoImage)
                DispatchQueue.global().async {
           let data = try? Data(contentsOf: resturantLogoImage)
           if let data = data {
               let image = UIImage(data: data)
               DispatchQueue.main.async {
                   cell.viewPannar.image = image
               }
             }
           }
         }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
  }
