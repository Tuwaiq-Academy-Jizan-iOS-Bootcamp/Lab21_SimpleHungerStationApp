import UIKit

class RestaurantMenu: UIViewController {

    
    @IBOutlet weak var menuTabelView: UITableView!
    @IBOutlet weak var backGroundImage: UIImageView!
    

    @IBOutlet weak var resturantLogoImageView: UIImageView! {
    didSet {
        if let imageUrl = URL(string: logoResiver) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        if let imageHolder = UIImage(data: imageData) {
                            self.resturantLogoImageView.image = imageHolder
                          }
                    }
                }
            }
              }
           }
      }
   

    @IBOutlet weak var promotedLabel: UILabel!
    
    {
        didSet {
            if promotedLabelResiver == "" {
                promotedLabel.isHidden = true
            }else {
                promotedLabel.text = promotedLabelResiver
            }
            promotedLabel.layer.masksToBounds = true
            promotedLabel.layer.cornerRadius = 10
        }
    }


    @IBOutlet weak var resturantRatingLabel: UILabel!
    

    @IBOutlet weak var resturantNameLabel: UILabel! {
    didSet {
        resturantNameLabel.text = nameResiver
    }
}

    @IBOutlet weak var resturantContantLabel: UILabel! {
    didSet {
        resturantContantLabel.text = contantResiver
    }
}
    

    @IBOutlet weak var minimumCostLabel: UILabel! {
    
    didSet {
        minimumCostLabel.text = "\(minimumCostResiver) SR"
    }
}
    

    @IBOutlet weak var deliveryLabel: UILabel! {

    didSet {
        deliveryLabel.text = "\(deliveryCostResiver) SR"
    }
}
    
    
    @IBOutlet weak var deliveryTimeLabel: UILabel! {
    didSet {
        deliveryTimeLabel.text = "\(deliveryMinTimeResiver) - \(deliveryMaxTimeResiver) minutes"
    }
}

    
    var idResiver = 0
    var backImageResiver : UIImage?
    var logoResiver = ""
    var nameResiver = ""
    var raitingResiver:Float = 0
    var contantResiver = ""
    var minimumCostResiver:Double = 0
    var deliveryCostResiver:Double = 0
    var deliveryMinTimeResiver = 0
    var deliveryMaxTimeResiver = 0
    var promotedLabelResiver = ""

    
    
    
    
    
    
    var restorantMenu: Menus = Menus(menu: [])
    var restorantsId = 0
    var restorantBackImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundImage.image = backImageResiver
    //    print(backImageResiver, "Error0000000000")
        menuTabelView.delegate = self
        menuTabelView.dataSource = self
        downloadRestorantMenuData(restorantsId)
        menuTabelView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "menu")
    }
    func downloadRestorantMenuData(_ FromURL: Int) {
        if let urlData = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(FromURL)") {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            self.restorantMenu = try decorder.decode(Menus.self, from: restorantData)
                            DispatchQueue.main.async {
                                self.menuTabelView.reloadData()
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
extension RestaurantMenu:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu") as! MenuCell
            cell.textOneLabel.text = restorantMenu.menu[indexPath.row].title
            if let subTitle = restorantMenu.menu[indexPath.row].subtitle {
                cell.textTwoLabel.text = subTitle
            }else {
                cell.textTwoLabel.isHidden = true
            }
            cell.priceLabel.text = "\(restorantMenu.menu[indexPath.row].price.value) \(restorantMenu.menu[indexPath.row].price.currency)"
            if let kalorise = restorantMenu.menu[indexPath.row].calories {
                cell.kalorisLabel.text = " \(kalorise) Kcal"
            }else {
                cell.kalorisLabel.isHidden = true
                cell.flameImageView.isHidden = true
            }
            if let foodImage = URL(string: restorantMenu.menu[indexPath.row].image) {
                DispatchQueue.global().async {
                    if let foodImage = try? Data(contentsOf: foodImage) {
                        let image = foodImage
                        DispatchQueue.main.async {
                            cell.foodImageView.image = UIImage(data: image)
                        }
                    }
                }
            }
        return cell
    }
    
  


}
