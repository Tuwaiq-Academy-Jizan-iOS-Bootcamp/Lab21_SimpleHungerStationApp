//
//  MenuViewController.swift
//  NouraLab21
//
//  Created by NoON .. on 10/04/1443 AH.
//

import UIKit

class MenuViewController: UIViewController {
    var id = 0
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var logoMenuImage: UIImageView!
    @IBOutlet weak var resturantNameMenuLabe: UILabel!
    @IBOutlet weak var starLabe: UILabel!
    @IBOutlet weak var typeFoodMenuLabe: UILabel!
    @IBOutlet weak var timeMenuLabe: UILabel!
    @IBOutlet weak var minimumPriceLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var deliveryChargeMenuLabel: UILabel!
    @IBOutlet weak var menuTableView: UITableView!{
        didSet {
            menuTableView.delegate = self
           menuTableView.dataSource = self
        }
    }
    var hightV:CGFloat = 0
    var largHight:CGFloat = 50
    @IBOutlet weak var hightView2: NSLayoutConstraint!
    @IBOutlet weak var ViewLarg: UIView!{
        didSet{
            ViewLarg.layer.masksToBounds = true
            ViewLarg.layer.cornerRadius = 15
            ViewLarg.layer.masksToBounds = false
            ViewLarg.layer.shadowOffset = CGSize(width: 0, height: 0)
            ViewLarg.layer.shadowColor = UIColor.black.cgColor
            ViewLarg.layer.shadowOpacity = 0.5
            ViewLarg.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var ViewSm: UIView!{
        didSet{
            ViewSm.layer.masksToBounds = true
            ViewSm.layer.cornerRadius = 15
        }
    }
    var selectedHungerstation:RestorantsData?
    var menu1 = [MenusData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        logoMenuImage.image = nil
        menuImage.image = nil
        if let selectedHungerstation = selectedHungerstation {
            resturantNameMenuLabe.text = selectedHungerstation.name
            typeFoodMenuLabe.text = selectedHungerstation.category
            // delivery time
            timeMenuLabe.text = "\(selectedHungerstation.delivery.time.max) - \(selectedHungerstation.delivery.time.min) Minutes"
            starLabe.text = "\(selectedHungerstation.rating)"
            minimumPriceLabel.text = "\(selectedHungerstation.delivery.time.min) SR"
            // delivery cost 1
            codeLabel.text = "\(selectedHungerstation.delivery.cost.currency) \(selectedHungerstation.delivery.cost.value)"
            // delivery cost 2
            deliveryChargeMenuLabel.text =
            "\(selectedHungerstation.delivery.cost.currency) \(selectedHungerstation.delivery.cost.value)"
            // offer
            if  selectedHungerstation.offer != nil {
                let value = selectedHungerstation.offer?.value
                let spend = selectedHungerstation.offer?.spend
                deliveryChargeMenuLabel.text = "\(value!) "+"(Spend \(spend!) SR)"
            }else {
                deliveryChargeMenuLabel?.removeFromSuperview()
            }
            // image
            logoMenuImage.image = nil
            if let imageL = URL(string: selectedHungerstation.resturant_image){
                DispatchQueue.global().async {
                    let data0 = try? Data(contentsOf: imageL)
                    if let data = data0 {
                        let imge2 = UIImage(data: data)
                        DispatchQueue.main.async {
                                self.logoMenuImage.image = imge2
                    }
            }
                }
            }
            menuImage.image = nil
            if let imageL = URL(string: selectedHungerstation.image){
                DispatchQueue.global().async {
                    let data0 = try? Data(contentsOf: imageL)
                    if let data = data0 {
                        let imge2 = UIImage(data: data)
                        DispatchQueue.main.async {
                                self.menuImage.image = imge2
                    }
            }
                }
            }
            menuTableView.reloadData()
            id = selectedHungerstation.id
            downloadMenuData()
        }
    }
    //step url menu
    func downloadMenuData() {
        if let UrlRestorantData0 = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)"){
            let urlSession0 = URLSession(configuration: .default)
            let task0 = urlSession0.dataTask(with: UrlRestorantData0) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let menuData = data {
                        do {
                            let decorder0 = JSONDecoder()
                            let menuInfo = try decorder0.decode(Menus.self, from: menuData)
                            print(menuInfo.menu)
                            self.menu1 = menuInfo.menu
                            DispatchQueue.main.async {
                                self.menuTableView.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            task0.resume()
        }
    }
}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMenu = tableView.dequeueReusableCell(withIdentifier:"tocellMenu", for: indexPath) as! ListTableViewCell
        cellMenu.mealNameLabel.text = menu1[indexPath.row].title
        cellMenu.productPriceLabel.text = "\(menu1[indexPath.row].price.value)"
         // subtitle
        if let subtitle = menu1[indexPath.row].subtitle {
            cellMenu.subTitleLabel.text = "\(subtitle)"
        }else {
            cellMenu.subTitleLabel.isHidden = true
        }
        // calories
        if let calories = menu1[indexPath.row].calories {
            cellMenu.caloriesLabel.text = "\(calories)"
        }else {
            cellMenu.caloriesLabel.isHidden = true
                 cellMenu.imageCL.isHidden = true
        }
        // code image
        cellMenu.productImage.image = nil
        if let imageL = URL(string: menu1[indexPath.row].image){
            DispatchQueue.global().async {
                let data0 = try? Data(contentsOf: imageL)
                if let data = data0 {
                    let imge1 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil{
                        cellMenu.productImage.image = imge1
                }
            }
        }
            }
        }
       cellMenu.layer.masksToBounds = true
        cellMenu.layer.cornerRadius = 15
      return cellMenu
    }
    func tableView(_ tableView: UITableView, heightForRowAt
    indexPath: IndexPath)
    -> CGFloat {
    return 100
    }
   // code scrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0{
            if ViewLarg.bounds.size.height > 63 {
                let offsetDiff = hightV - scrollView.contentOffset.y
                let newHeight = hightView2.constant + offsetDiff
                     hightView2.constant = newHeight
        }
        }else{
            if ViewLarg.bounds.size.height < 171{
                let offsetDiff = hightV - scrollView.contentOffset.y
                let newHeight = hightView2.constant + offsetDiff
                     hightView2.constant = newHeight
        }
}
    }
}
