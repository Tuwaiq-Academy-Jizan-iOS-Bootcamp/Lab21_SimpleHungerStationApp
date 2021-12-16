


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var restaurantTableView: UITableView!
    
        
    var restorants: Restorants = Restorants(data: [])
    var idSender = 0
    
    var restorantBackImageSender : UIImage?
    
   
    var logoSener = ""
    var nameSender = ""
    var raitingSender:Float = 0
    var contantSender = ""
    var minimumCostSender:Double = 0
    var deliveryCostSender:Double = 0
    var deliveryMinTimeSender = 0
    var deliveryMaxTimeSender = 0
    var promotedLabelSender = ""
    
    
    
    
        let restorantsURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
        override func viewDidLoad() {
            super.viewDidLoad()
            downloadRestorantData(restorantsURL)
            restaurantTableView.delegate = self
            restaurantTableView.dataSource = self
        }
    
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let toRestaurantMenu = segue.destination as? RestaurantMenu
            toRestaurantMenu?.restorantsId = idSender
            toRestaurantMenu?.backImageResiver = restorantBackImageSender
            
            toRestaurantMenu?.logoResiver = logoSener
            toRestaurantMenu?.nameResiver = nameSender
            toRestaurantMenu?.raitingResiver = raitingSender
            toRestaurantMenu?.minimumCostResiver = minimumCostSender
            toRestaurantMenu?.deliveryCostResiver = deliveryCostSender
            toRestaurantMenu?.deliveryMinTimeResiver = deliveryMinTimeSender
            toRestaurantMenu?.deliveryMaxTimeResiver = deliveryMaxTimeSender
            toRestaurantMenu?.promotedLabelResiver = promotedLabelSender
            
            
        }
    
    
        func downloadRestorantData(_ FromURL: String) {
            if let urlData = URL(string: FromURL) {
                let urlSession = URLSession(configuration: .default)
                let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
                    if let error = error {
                        print("The URL Is Not Working", error.localizedDescription)
                    }else {
                        if let restorantData = data {
                            do {
                                let decorder = JSONDecoder()
                                self.restorants = try decorder.decode(Restorants.self, from: restorantData)
                                DispatchQueue.main.async {
                                    self.restaurantTableView.reloadData()
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

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restorants.data.count
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        
    }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = restaurantTableView.dequeueReusableCell(withIdentifier: "cell") as! resturantCell
            cell.resturantNameLabel.text = restorants.data[indexPath.row].name
            if restorants.data[indexPath.row].offer != nil {
                if let offer = restorants.data[indexPath.row].offer {
                    if offer.value.contains("%") {
                        cell.priceConditionLabel.text = "  \(offer.value) Your Order (spend \(offer.spend) SAR)     "
                    }else {
                        cell.priceConditionLabel.text = "  \(offer.value) (spend \(offer.spend) SAR)     "
                    }
                }
            }else{
                cell.priceConditionLabel.isHidden = true
            }
            if restorants.data[indexPath.row].is_promoted == true {
                cell.promotedLabel.text = "Promoted"
            }else{
                cell.promotedLabel.isHidden = true
            }
            cell.foodTypeLabel.text = restorants.data[indexPath.row].category
            cell.ratingResturantLabel.text = "\(restorants.data[indexPath.row].rating)"
            cell.deliveryLabel.text = " \(restorants.data[indexPath.row].delivery.time.min) - \(restorants.data[indexPath.row].delivery.time.max) minutes | Delivery: \(restorants.data[indexPath.row].delivery.cost.value)\(restorants.data[indexPath.row].delivery.cost.currency) |"
            if let restorantlogo = URL(string: restorants.data[indexPath.row].resturant_image) {
                DispatchQueue.global().async {
                    if let restorantlogo = try? Data(contentsOf: restorantlogo) {
                        let logo = restorantlogo
                        DispatchQueue.main.async {
                            cell.logoResturantImageView.image = UIImage(data: logo)
                        }
                    }
                }
            }
        
            if let restorantBackImage = URL(string: restorants.data[indexPath.row].image) {
                DispatchQueue.global().async {
                    if let restorantBackImage = try? Data(contentsOf: restorantBackImage) {
                        let backImage = restorantBackImage
                        DispatchQueue.main.async {
                            cell.resturantImageView.image = UIImage(data: backImage)
                        }
                    }
                }
            }
    
            cell.logoResturantImageView.layer.masksToBounds = true
            cell.logoResturantImageView.layer.cornerRadius = 10
            cell.promotedLabel.layer.masksToBounds = true
            cell.promotedLabel.layer.cornerRadius = 6
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            idSender = restorants.data[indexPath.row].id
            
            let cell = tableView.cellForRow(at: indexPath) as? resturantCell
            
            restorantBackImageSender = cell?.resturantImageView.image
            logoSener = restorants.data[indexPath.row].resturant_image
            nameSender = restorants.data[indexPath.row].name
            
           // raitingSender = restorants.data[indexPath.row].rating
            
            contantSender = restorants.data[indexPath.row].category
            minimumCostSender = restorants.data[indexPath.row].delivery.cost.value
            deliveryCostSender = restorants.data[indexPath.row].delivery.cost.value
            deliveryMinTimeSender = restorants.data[indexPath.row].delivery.time.min
            deliveryMaxTimeSender = restorants.data[indexPath.row].delivery.time.max
            if restorants.data[indexPath.row].offer != nil {
                if let offer = restorants.data[indexPath.row].offer {
                    if offer.value.contains("%") {
                        promotedLabelSender = " \(offer.value) Your Order (spend \(offer.spend) SAR) "
                    }else {
                        promotedLabelSender = " \(offer.value) (spend \(offer.spend) SAR) "
                    }
                }
            }else {
                promotedLabelSender = ""
            }
            
            performSegue(withIdentifier: "toMenu", sender: self)
        }
    }











