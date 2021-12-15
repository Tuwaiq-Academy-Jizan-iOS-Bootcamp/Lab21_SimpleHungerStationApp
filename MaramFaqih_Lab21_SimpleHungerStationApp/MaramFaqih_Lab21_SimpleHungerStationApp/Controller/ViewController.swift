//
//  ViewController.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//
import Foundation
import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{
    
    var locationManager  = CLLocationManager()
 
    @IBOutlet weak var resturantsTableView: UITableView!
    @IBOutlet weak var headerImageView: UIImageView!
    
    var headers : [String] = []
    var resturantNameStruct : [DataSet] = []
    var resturantNameSelected : [DataSet] = []


     var nameSelected = ""
     var deliveryTimeSelected = ""
     var ratingSelected = ""
     var cuisineSelected = ""
     var offerSelected : String? = nil
     var DeliveryPriceSelected = ""
     var minimumSelected = ""
     var menuSelected : Int = Int()
     var logoSelected = ""
     var imageSelected = ""
     var index = 0
    
    @IBOutlet weak var countryLocation: UILabel!
    
  
  
 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     //----------------location------------------//
     
        locationManager.delegate = self
        //locationManager1  = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLLocationAccuracyHundredMeters

        locationManager.stopUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
       // locationManager1.requestLocation()

        // check if location enabled
        if CLLocationManager.locationServicesEnabled() {
            print("Yes")
            locationManager.startUpdatingLocation()
            print("Yes")
        }else{
            print("No")
        }
        //--------------------------------------------//

    }
         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){

             let userLocation = locations[0] as CLLocation
//             var latitude = userLocation.coordinate.latitude
//             var longitude = userLocation.coordinate.longitude
             print("userLocation: \(userLocation)")

             let geoCoder = CLGeocoder()
             geoCoder.reverseGeocodeLocation(userLocation){ (placeMarks, error) in
                 if error != nil {
                     print("Error")
                 }

                 let placeMark = placeMarks! as [CLPlacemark]
                 if placeMark.count>0 {
                     let placeMark = placeMarks![0]
                     self.locationManager.stopUpdatingLocation()

                     let country = placeMark.locality
                    // print(country)
                     self.countryLocation.text = country ?? "Unknown"
                     print(country ?? "")

                 }

             }
             
       
        headerImageView.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
        headerImageView.layer.masksToBounds = true
        resturantsTableView.delegate = self
        resturantsTableView.dataSource = self
        headers = ["h1","h2","h3","h4"]

        getaData(with:"restaurants")
        }
    
    
    func getaData(with endPoint:String){
        
        let baseURL = "https://hungerstation-api.herokuapp.com/api/v1/\(endPoint)"
       if let url = URL(string: baseURL) {
        let session = URLSession(configuration: .default)
       
        let task = session.dataTask(with: url){ data, respons, error in
            if let error = error {
                print("error",error.localizedDescription)
            }else{
                if let safeData = data {
                    do{
                           let decoder = JSONDecoder()
                          
                           let decoderData = try decoder.decode(Restaurant.self, from: safeData)
                        DispatchQueue.main.async {
                            self.resturantNameStruct  = decoderData.data
                                   self.resturantsTableView.reloadData()

                     }


                } catch{
                       print("error f",error.localizedDescription)

               }
           }
       }
    }
           task.resume()
       }
    }


    @IBAction func headerTapGestur(_ sender: UITapGestureRecognizer) {
      
    }
    
    @IBAction func headerSwipeGesturRight(_ sender: UISwipeGestureRecognizer) {
        if (index != 0){
            index -= 1
            }else{
                index = headers.count-1
            }
        headerImageView.image=UIImage(named: headers[index])
    }
    
    @IBAction func headerSwipeGesturLeft(_ sender: UISwipeGestureRecognizer) {
        if (index != headers.count-1){
            index += 1
            }else{
                index = 0
            }
        headerImageView.image=UIImage(named: headers[index])
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destintionToDetails = segue.destination as! ResturantView


            destintionToDetails.nameSelectedT =  nameSelected
            destintionToDetails.deliveryTimeSelectedT =  deliveryTimeSelected
            destintionToDetails.ratingSelectedT =  ratingSelected
            destintionToDetails.cuisineSelectedT =  cuisineSelected
            destintionToDetails.offerSelectedT =  offerSelected
            destintionToDetails.logoSelectedT =  logoSelected
            destintionToDetails.imageSelectedT =  imageSelected
            destintionToDetails.menuSelectedT =  menuSelected
            destintionToDetails.DeliveryPriceSelectedT = DeliveryPriceSelected
            destintionToDetails.minimumSelectedT = minimumSelected
            destintionToDetails.resturantNameSelectedT = resturantNameSelected

        }
    @IBAction func backToFrist(segue:UIStoryboardSegue){
        
    }
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return resturantNameStruct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! ResturntCell

        tableView.backgroundColor = .systemGray6

        cell.nameCell.text = resturantNameStruct[indexPath.row].name
        cell.deliveryTimeCell.text = String(resturantNameStruct[indexPath.row].delivery.time.min)+" - "+String(resturantNameStruct[indexPath.row].delivery.time.max)+" minutes"
        cell.ratingCell.text = String(resturantNameStruct[indexPath.row].rating)
        cell.cuisineCell.text = resturantNameStruct[indexPath.row].category

        cell.isPromotedCell.layer.masksToBounds = true
        cell.isPromotedCell.layer.cornerRadius = 5
        
        if resturantNameStruct[indexPath.row].is_promoted {
            cell.isPromotedCell.text = " Promoted "
            
        }else{
            cell.isPromotedCell.isHidden = true
        }
        if let offer = resturantNameStruct[indexPath.row].offer{
            cell.offerCell.text = "\(offer.value) (Spend \(offer.spend))"
            
        }else{
            cell.viewOffer.isHidden = true

        }
  
            let urlImage = URL(string:resturantNameStruct[indexPath.row].image)
            if let urlImage = urlImage {
              DispatchQueue.global().async {
                  if let data = try? Data(contentsOf: urlImage){
                  DispatchQueue.main.async {

                    if tableView.cellForRow(at: indexPath) != nil {
                      cell.imageCell.image = UIImage(data: data)
                    }
                  }
                }
              }
            }
        let urlImageLogo = URL(string:resturantNameStruct[indexPath.row].resturant_image)
        if let urlImage = urlImageLogo {
          DispatchQueue.global().async {
              if let data = try? Data(contentsOf: urlImage){
              DispatchQueue.main.async {

                if tableView.cellForRow(at: indexPath) != nil {
                  cell.logoCell.image = UIImage(data: data)
               }
              }
            }
          }
        }

        
        cell.deliveryPriceCell.text = String(resturantNameStruct[indexPath.row].delivery.cost.value) + resturantNameStruct[indexPath.row].delivery.cost.currency
       
        cell.cuisineCell.sizeToFit()
        cell.offerCell.sizeToFit()
        //Path part
        let path = UIBezierPath()
        path.move(to: .zero) //StartPoint frame.size
        path.addLine(to: CGPoint(x: cell.offerCell.bounds.size.width+25, y: 0))
        path.addLine(to: CGPoint(x: cell.offerCell.bounds.size.width+15, y: 27))
        path.addLine(to: CGPoint(x: 0, y: 27))
       
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        //cell.offerCell.sizeToFit()
        cell.viewOffer.layer.mask=shape
        //cell.viewOffer.sizeToFit()
        
        return cell
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        
        return view
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 10 , dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrPath = resturantNameStruct[indexPath.row]
        nameSelected = arrPath.name
        deliveryTimeSelected = String(arrPath.delivery.time.min)+" - "+String(arrPath.delivery.time.max)+" minutes"

        ratingSelected = String(arrPath.rating)
        cuisineSelected = arrPath.category
        if let offer = resturantNameStruct[indexPath.row].offer{
            offerSelected = "\(offer.value) (Spend \(offer.spend))"
            
        }
        else
        {
            offerSelected = nil
        }
        imageSelected = arrPath.image
        logoSelected = arrPath.resturant_image

       menuSelected = arrPath.id
        DeliveryPriceSelected = String(arrPath.delivery.cost.value)+" "+arrPath.delivery.cost.currency
        minimumSelected = String(arrPath.delivery.cost.value)+" "+arrPath.delivery.cost.currency
        
        performSegue(withIdentifier: "toRestrunt", sender: indexPath)
    }

}
 
