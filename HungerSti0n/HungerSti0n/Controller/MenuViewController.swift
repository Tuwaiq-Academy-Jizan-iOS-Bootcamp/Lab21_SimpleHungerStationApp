//
//  MenuViewController.swift
//  HungerSti0n
//
//  Created by يوسف جابر المالكي on 10/05/1443 AH.
//

import UIKit
class MenuViewController: UIViewController {
    @IBOutlet weak var menuTabelView: UITableView! {
        didSet {
            menuTabelView.delegate = self
            menuTabelView.dataSource = self
            menuTabelView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
            menuTabelView.backgroundColor = .white
        }
    }
   
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.layer.masksToBounds = true
            backButton.layer.cornerRadius = 23.5
        }
    }
    @IBOutlet weak var ViewHeader: UIView! {
        didSet {
            ViewHeader.layer.masksToBounds = true
            ViewHeader.layer.cornerRadius = 10
            ViewHeader.layer.shadowColor = UIColor.black.cgColor
            ViewHeader.layer.shadowOpacity = 1
            ViewHeader.layer.shadowOffset = .zero            
        }
    }
    @IBOutlet weak var promotedLabel: UILabel! {
        didSet {
            if promotedLabelResiver == "" {
                promotedLabel.isHidden = true
            }else {
            promotedLabel.text = promotedLabelResiver
            }
            promotedLabel.layer.masksToBounds = true
            promotedLabel.layer.cornerRadius = 8
        }
    }
    
    // Header
    @IBOutlet weak var restorantName: UILabel! {
        didSet {
            restorantName.text = nameResiver
        }
    }
    @IBOutlet weak var restorantRaiting: UILabel! {
        didSet {
            restorantRaiting.text = "\(raitingResiver)"
        }
    }
    @IBOutlet weak var restorantMeal: UILabel! {
        didSet {
            restorantMeal.text = contantResiver
        }
    }
    @IBOutlet weak var minimumCost: UILabel! {
        didSet {
            minimumCost.text = "\(minimumCostResiver) SR"
        }
    }
    @IBOutlet weak var delivery: UILabel! {
        didSet {
            delivery.text = "\(deliveryCostResiver) SR"
        }
    }
    @IBOutlet weak var deliveryTime: UILabel! {
        didSet {
            deliveryTime.text = "\(deliveryMinTimeResiver) - \(deliveryMaxTimeResiver) minutes"
        }
    }
    
    // End Of Header
    var restorantMenu: Menus = Menus(menu: [])
    var idResiver = 0
    var backImageResiver = ""
    var logoResiver = ""
    var nameResiver = ""
    var raitingResiver:Float = 0
    var contantResiver = ""
    var minimumCostResiver:Double = 0
    var deliveryCostResiver:Double = 0
    var deliveryMinTimeResiver = 0
    var deliveryMaxTimeResiver = 0
    var promotedLabelResiver = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        downloadRestorantMenuData(idResiver)
    }
    func downloadRestorantMenuData(_ FromURL: Int) {
        if let urlData = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(FromURL)") {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
                if let error = error {
                    print(error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            self.restorantMenu = try decorder.decode(Menus.self, from: restorantData)
                            DispatchQueue.main.async {
                                self.menuTabelView.reloadData()
                            }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            urlTask.resume()
        }
    }
    // Images

    @IBOutlet weak var backGraoundImageMenu: UIImageView! {
        didSet {
            if let imageUrl = URL(string: backImageResiver) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            if let imageHolder = UIImage(data: imageData) {
                                self.backGraoundImageMenu.image = imageHolder
                            }
                        }
                    }
                }
            }
        }
    }
    @IBOutlet weak var restorantLogo: UIImageView! {
        didSet {
            if let imageUrl = URL(string: logoResiver) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            if let imageHolder = UIImage(data: imageData) {
                                self.restorantLogo.image = imageHolder
                            }
                        }
                    }
                }
            }
        }
    }

}

