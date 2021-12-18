//
//  MenuController.swift
//  Hungerstation224
//
//  Created by موسى مسملي on 14/12/2021.
//

import UIKit
class MenuController: UIViewController {
    @IBOutlet weak var menuTabelView: UITableView! {
        didSet {
            menuTabelView.delegate = self
            menuTabelView.dataSource = self
        }
    }
    // Images
    @IBOutlet weak var backImage: UIImageView! {
        didSet {
            if let imageUrl = URL(string: backImageResiver) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            if let imageHolder = UIImage(data: imageData) {
                                self.backImage.image = imageHolder
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
    // End of Images
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.layer.masksToBounds = true
            backButton.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var header: UIView! {
        didSet {
            header.layer.masksToBounds = true
            header.layer.cornerRadius = 20
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
            promotedLabel.layer.cornerRadius = 10
        }
    }
    // Header Contant
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
    @IBOutlet weak var restorantContant: UILabel! {
        didSet {
            restorantContant.text = contantResiver
        }
    }
    @IBOutlet weak var minimumCost: UILabel! {
        didSet {
            minimumCost.text = "\(minimumCostResiver) SA"
        }
    }
    @IBOutlet weak var delivery: UILabel! {
        didSet {
            delivery.text = "\(deliveryCostResiver) SA"
        }
    }
    @IBOutlet weak var deliveryTime: UILabel! {
        didSet {
            deliveryTime.text = "\(deliveryMinTimeResiver) - \(deliveryMaxTimeResiver) minutes"
        }
    }
    // End Of Header Contant
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

