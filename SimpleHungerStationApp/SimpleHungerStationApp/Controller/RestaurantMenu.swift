import UIKit

class RestaurantMenu: UIViewController {

    
    @IBOutlet weak var menuTabelView: UITableView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    var restorantMenu: Menus = Menus(menu: [])
    var restorantsId = 0
    var restorantBackImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
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
            cell.mainText.text = restorantMenu.menu[indexPath.row].title
            if let subTitle = restorantMenu.menu[indexPath.row].subtitle {
                cell.secondaryText.text = subTitle
            }else {
                cell.secondaryText.isHidden = true
            }
            cell.price.text = "\(restorantMenu.menu[indexPath.row].price.value) \(restorantMenu.menu[indexPath.row].price.currency)"
            if let kalorise = restorantMenu.menu[indexPath.row].calories {
                cell.kaloris.text = " \(kalorise) Kcal"
            }else {
                cell.kaloris.isHidden = true
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
