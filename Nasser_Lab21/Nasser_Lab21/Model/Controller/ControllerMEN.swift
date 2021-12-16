//
//  SceneDelegate.swift
//  Nasser_Lab21
//
//  Created by Nasser Aseeri on 10/05/1443 AH.
//


import UIKit
class ControllerMEN: UIViewController {
    @IBOutlet weak var menuTabelView: UITableView! {
        didSet {
            menuTabelView.delegate = self
            menuTabelView.dataSource = self
            menuTabelView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
            menuTabelView.backgroundColor = .systemGray6
        }
    }
    // DispatchQueue Image
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
            restorantLogo.layer.masksToBounds = true
            restorantLogo.layer.cornerRadius = 10
        }
    }
    // End of Images
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.layer.masksToBounds = true
            backButton.layer.cornerRadius = backButton.frame.width/2
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
            promotedLabel.layer.cornerRadius = 10          //نصف القطر المطلوب استخدامه عند رسم الزوايا الدائرية لخلفية

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
    var restorantMenu: Menus = Menus(menu: [])               //structMenus
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
    // Header Animation
    @IBOutlet weak var heightOfView: NSLayoutConstraint!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerSize: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        
        
        fetchData(idResiver)
        menuTabelView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "menu")
    }
    
    
    
    
    
    
    func fetchData(_ foodUrl: Int) {
        if let urlBaseString = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(foodUrl)") {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: urlBaseString) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let restorantData = data {
                     
                        //عمل ديكودر لقراءة البيانات التي وضعناها في restorantMenu الموجود في Items
                        
                        do {
                            let decorder = JSONDecoder()
                            self.restorantMenu = try decorder.decode(Menus.self, from: restorantData)
                            DispatchQueue.main.async {
                                self.menuTabelView.reloadData()  //
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


extension ControllerMEN:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let newHeight = scrollView.contentOffset.y  + 10
        // View Size
        if heightOfView.constant > 324 {
            heightOfView.constant = 324
        }else if heightOfView.constant < 230 {
            heightOfView.constant = 230
        }
        // Header Height
        if headerHeight.constant > 135 {
            headerHeight.constant = 135
        }else if headerHeight.constant < 80 {
            headerHeight.constant = 80
        }
        // Header Size
        if headerSize.constant > 120 {
            headerSize.constant = 120
        }else if headerSize.constant < 75 {
            headerSize.constant = 75
        }
        // Oborations
        heightOfView.constant -= newHeight
        headerHeight.constant -= newHeight
        headerSize.constant -= newHeight / 2
    }
}
