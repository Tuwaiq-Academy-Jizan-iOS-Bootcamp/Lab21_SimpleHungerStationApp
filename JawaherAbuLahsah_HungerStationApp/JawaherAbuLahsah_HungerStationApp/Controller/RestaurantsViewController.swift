//
//  ViewController.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/04/1443 AH.
//

import UIKit
import CoreLocation

class RestaurantsViewController: UIViewController, CLLocationManagerDelegate ,HamburgerMenuControllerDelegate{
    
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var restaurantsTableView: UITableView!
    @IBOutlet weak var hamburgerMenuView: UIView!
    @IBOutlet weak var hamburgerMenuConstraintLeading: NSLayoutConstraint!
    
    
    
    var hamburgerMenuViewController:HamburgerViewController?
    var isHamburgerMenuShown:Bool = false
    var restaurants = Restaurant(data: [])
    var selectRestaurant : RestaurantData?
    let locationManager = CLLocationManager()
    
    
    //for image in header
    let headerImages = ["h1","h2","h3","h4","h4","h6"]
    var imageNumber = 0
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        if imageNumber < 0 {
            imageNumber = 5
        }else{
        headerImageView.image = UIImage(named: headerImages[imageNumber])
        imageNumber -= 1
        }
    }
    
    
  //  let screenRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
//        let screenRect = UIScreen.main.bounds
//        let screenHeight = screenRect.size.height
//        if screenHeight < 800{
//        restaurantsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
//        }
//       
        
        // for get location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        //to get data
        API.shared.getData(endPoint: "restaurants") { (restaurantData:Restaurant) in
            self.restaurants = restaurantData
            DispatchQueue.main.async {
                self.restaurantsTableView.reloadData()
            }
        }
    }
    
    
    //location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        location.fetchCityAndCountry { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            self.navigationItem.title = "\(city + ", " + country)"
        }
    }
    
    
    //to send data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            let sender = segue.destination as! MenuForRestaurant
            sender.selectRestaurant = selectRestaurant
        }
        if segue.identifier == "hamburgeSegue"{
            if let senderMenu = segue.destination as? HamburgerViewController {
                hamburgerMenuViewController = senderMenu
                hamburgerMenuViewController?.delegate = self
            }
        }
    }
    
    @IBAction func unwindViweController(segue:UIStoryboardSegue){
    }
    
    
    
    //Hide hamburgerMenu
    func hideHamburgerMenu() {
        UIView.animate(withDuration: 0.2) {
            self.hamburgerMenuConstraintLeading.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            self.hamburgerMenuView.alpha = 0.0
            UIView.animate(withDuration: 0.2) {
                self.hamburgerMenuConstraintLeading.constant = -261
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.hamburgerMenuView.isHidden = true
                self.isHamburgerMenuShown = false
            }
        }
    }
    @IBAction func tappedOnBackView(_ sender: Any) {
        hideHamburgerMenu()
    }
    
    //show hamburgerMenu
    @IBAction func hamburgerMenu(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.hamburgerMenuConstraintLeading.constant = 10
            self.view.layoutIfNeeded()
        } completion: { (status) in
            self.hamburgerMenuView.alpha = 0.9
            self.hamburgerMenuView.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.hamburgerMenuConstraintLeading.constant = 0
                self.view.layoutIfNeeded()
            } completion: { (status) in
                self.isHamburgerMenuShown = true
            }
        }
        hamburgerMenuView.isHidden = false
    }
}

extension RestaurantsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellElements
        cell.restaurantNameLabel.text = restaurants.data[indexPath.row].name
        cell.restaurantTypeLabel.text = restaurants.data[indexPath.row].category
        cell.deliveryPriceLabel.text = " \(restaurants.data[indexPath.row].delivery.cost.value)\(restaurants.data[indexPath.row].delivery.cost.currency)"
        cell.deliveryTimeLabel.text = "\(restaurants.data[indexPath.row].delivery.time.min):\(restaurants.data[indexPath.row].delivery.time.max)"
        
        
        if let offerValue = restaurants.data[indexPath.row].offer?.value , let offerSpend = restaurants.data[indexPath.row].offer?.spend{
            cell.restaurantOffersLabel.text = "\(offerValue) (Spend \(offerSpend)SR)"
            
            //for offers label
            let width = cell.restaurantOffersLabel.intrinsicContentSize.width
            let roundedRect = UIBezierPath(rect : CGRect(x: 0, y: 0, width: width, height: 25))
            roundedRect.move(to: CGPoint(x: width, y: 25))
            roundedRect.addLine(to: CGPoint(x: width+30, y: 0))
            roundedRect.addLine(to: CGPoint(x: width, y: 0))
            roundedRect.move(to: CGPoint(x: width, y: 0))
            roundedRect.addLine(to: CGPoint(x: width+20, y: 0))
            let shape = CAShapeLayer()
            shape.path = roundedRect.cgPath
            shape.fillColor = UIColor.systemBlue.cgColor
            cell.offersView.layer.addSublayer(shape)
            cell.offersView.addSubview(cell.restaurantOffersLabel)
        }else{
            cell.restaurantOffersLabel.isHidden = true
        }
        
        
        if restaurants.data[indexPath.row].is_promoted{
            cell.promotedLabel.isHidden = false
        }else{
            cell.promotedLabel.isHidden = true
        }
        
        
        cell.restaurantRatingLabel.text = String(restaurants.data[indexPath.row].rating)
        cell.restaurantDisplayImageView.loadImage(restaurants.data[indexPath.row].image)
        cell.restaurantLogoImageView.loadImage(restaurants.data[indexPath.row].resturant_image)
        cell.restaurantLogoImageView.layer.cornerRadius = 10
        
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.lightGray.cgColor
        tableView.backgroundColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRestaurant = restaurants.data[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
