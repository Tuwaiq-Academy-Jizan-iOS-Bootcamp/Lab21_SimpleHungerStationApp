import UIKit
class MenuViewController: UIViewController {
    @IBOutlet weak var menuTabelView: UITableView! {
        didSet {
            menuTabelView.delegate = self
            menuTabelView.dataSource = self
            menuTabelView.backgroundColor = .systemGray6
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
            restorantLogo.layer.masksToBounds = true
            restorantLogo.layer.cornerRadius = 10
        }
    }
    // End of Images
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.layer.masksToBounds = true
            backButton.layer.cornerRadius = backButton.frame.width / 2
        }
    }
    @IBOutlet weak var header: UIView! {
        didSet {
            header.layer.masksToBounds = false
            header.layer.cornerRadius = 20
            header.layer.shadowColor = UIColor.black.cgColor
            header.layer.shadowOffset = CGSize.zero
            header.layer.shadowRadius = 3
            header.layer.shadowOpacity = 0.5
        }
    }
    @IBOutlet weak var promotedLabel: UILabel! {
        didSet {
            if promotedLabelResiver == "" {
                promotedLabel.isHidden = true
            }else {
            promotedLabel.text = promotedLabelResiver
            }
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
    @IBOutlet weak var promotedStackShape: UIStackView! {
        didSet {
            promotedStackShape.layer.masksToBounds = true
            promotedStackShape.layer.cornerRadius = 10
            if promotedLabelResiver == "" {
                promotedStackShape.isHidden = true
            }else {
            promotedLabel.text = promotedLabelResiver
            }
        }
    }
    // End Of Header Contant
    var restorantMenu: MenuResponse = MenuResponse(menu: [])
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
        downloadRestorantMenuData(idResiver)
        self.navigationController?.navigationBar.isHidden = true
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
                            self.restorantMenu = try decorder.decode(MenuResponse.self, from: restorantData)
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
