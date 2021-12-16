//
//  MenuRestruantData.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 12/04/1443 AH.
//

import UIKit

class MenuRestruantData: UIViewController {
    var restorantMenu: Menus = Menus(menu: [])
    @IBOutlet weak var imageRestBG: UITableView! {
        didSet{
            imageRestBG.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
            imageRestBG.backgroundColor = .systemGray6
        }
    }
    @IBOutlet weak var viewOfMenuData: UIView!{
        didSet {
            viewOfMenuData.layer.masksToBounds = true
            viewOfMenuData.layer.cornerRadius = 18
        }
    }
    @IBOutlet weak var viewoffer: UIView!{
        didSet {
            viewoffer.layer.masksToBounds = true
            viewoffer.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var imageRestruantMenu: UIImageView!
    var restImageV2 = UIImage(named: "")
    @IBOutlet weak var nameOfRestruntMenu: UILabel!
    var nameRestV2 = ""
    @IBOutlet weak var typeOfFoodMenu: UILabel!
    var typeFoodV2 = ""
    @IBOutlet weak var spentToMenu: UILabel!
    var spendMenu = ""
    @IBOutlet weak var srMenu: UILabel!
    var srMenuV2 = ""
    @IBOutlet weak var timeDeliveryMenu: UILabel!
    var theDevierytime = ""
    @IBOutlet weak var evelationMenu: UILabel!
    var evelMwnuV2 = 0.1
    @IBOutlet weak var offerLabelMenu: UILabel!
    var offerLabelV2 = " "
    @IBOutlet weak var logoImageRestMenu: UIImageView!
    @IBOutlet weak var backButtonMenu: UIButton! {
        didSet {
            backButtonMenu.layer.masksToBounds = true
            backButtonMenu.layer.cornerRadius = backButtonMenu.frame.width/2
        }
    }
    var brandMenuV2 = UIImage(named: "")
    var restorantsId = 0
    var restorantBackImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        imageRestBG.delegate = self
        imageRestBG.dataSource = self
        //for the function API
        downloadRestorantMenuData(restorantsId)
        imageRestruantMenu.image = restImageV2
        logoImageRestMenu.image = brandMenuV2
        nameOfRestruntMenu.text = nameRestV2
        typeOfFoodMenu.text = typeFoodV2
        spentToMenu.text = spendMenu
        srMenu.text = String(srMenuV2)
        evelationMenu.text = String(evelMwnuV2)
        offerLabelMenu.text = offerLabelV2
        timeDeliveryMenu.text = theDevierytime
        
        
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
                                self.imageRestBG.reloadData()
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
extension MenuRestruantData:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.nameOfMeal.text = restorantMenu.menu[indexPath.row].title
        if let subTitle = restorantMenu.menu[indexPath.row].subtitle {
            cell.descriptionMenu.text = subTitle
        }else {
            cell.descriptionMenu.isHidden = true
        }
        cell.price.text = "\(restorantMenu.menu[indexPath.row].price.value) \(restorantMenu.menu[indexPath.row].price.currency)"
        if let caloris = restorantMenu.menu[indexPath.row].calories {
            cell.caloris.text = " \(caloris) cal"
        }else {
            cell.caloris.isHidden = true
            cell.trashImage.isHidden = true
        }
        if let foodImage = URL(string: restorantMenu.menu[indexPath.row].image) {
            DispatchQueue.global().async {
                if let foodImage = try? Data(contentsOf: foodImage) {
                    let image = foodImage
                    DispatchQueue.main.async {
                        cell.foodImage.image = UIImage(data: image)
                    }
                }
            }
        }
        return cell
    }
}
