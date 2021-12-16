

import Foundation
import UIKit
class ViewControllerTwo: UIViewController {
@IBOutlet weak var menusLogo: UIImageView!
@IBOutlet weak var MenusImage: UIImageView!
@IBOutlet weak var menusNameFood: UILabel!
@IBOutlet weak var menusStar: UILabel!
@IBOutlet weak var menusTypeFood: UILabel!
@IBOutlet weak var menusMenimam: UILabel!
@IBOutlet weak var menusPriceDelivery: UILabel!
@IBOutlet weak var menusTimeFood: UILabel!
@IBOutlet weak var menusOfferLabel: UILabel!
@IBOutlet weak var headerView: UIView!
@IBOutlet weak var DetileViewMenu: UIView!
@IBOutlet weak var menusOfferView: UIView!
@IBOutlet weak var tabelViewMenu: UITableView!{
    
        didSet{
            tabelViewMenu.delegate = self
            tabelViewMenu.dataSource = self
        }
    
    }
    
    
    var selectMenue:DataR?
    var menuArr:[Menu] = []
  

    override func viewDidLoad() {

       
       
        self.DetileViewMenu.layer.cornerRadius = 10
        
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOpacity = 1
        headerView.layer.shadowOffset = .zero
        headerView.layer.shadowRadius = 0.5
        headerView.layer.shadowPath = UIBezierPath(rect: headerView.bounds).cgPath
        headerView.layer.shouldRasterize = true

        restrunt()
        if let rest =  selectMenue{
            menusLogo.loadImageUsingCache(with:rest.resturant_image)
            MenusImage.loadImageUsingCache(with: rest.image)
            menusNameFood.text = rest.name
            menusStar.text = String(rest.rating)
            menusTypeFood.text = rest.category
            menusMenimam.text = "\(20)SR"
            menusPriceDelivery.text = "\(2)SR"
            menusTimeFood.text =
            "\(rest.delivery.time.min) - \(rest.delivery.time.max)"
          
            if let offer =  rest.offer  {
                menusOfferLabel.text = offer.value + "\(offer.spend)"
            
                
            }else{
                menusOfferLabel.isHidden = true
                menusOfferView.isHidden = true
            }
        
            }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
func restrunt() {
    let urlRestrent = "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(self.selectMenue?.id ?? 1)"
if let urlResponse = URL(string: urlRestrent){
let urlSesstion = URLSession(configuration: .default)
let urlTask = urlSesstion.dataTask(with: urlResponse) { data, response, error in
        if let error = error {
            print("Error", error.localizedDescription)
        }else{
            
            if let safeData = data {
                let decoder = JSONDecoder()
                do{
                    let foodData = try decoder.decode(Menus.self, from: safeData)
                    self.menuArr = foodData.menu
                    print(self.menuArr)
                    DispatchQueue.main.async {
                        self.tabelViewMenu.reloadData()
                    }
                
                } catch{
                    print("EEEEE",error.localizedDescription)
                }
            }
        }
}
        urlTask.resume()
        
        
    }
    
    
}
    

}
extension ViewControllerTwo:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! DetailsTabelViewCellTwo
        
        
        cell.imageFood.loadImageUsingCache(with: menuArr[indexPath.row].image)
        cell.nameFood.text = menuArr[indexPath.row].title
        
        cell.priceFood.text = "\(self.menuArr[indexPath.row].price.value) - \(self.menuArr[indexPath.row].price.currency)"
        cell.subTitle.text = menuArr[indexPath.row].subtitle
        if self.menuArr[indexPath.row].calories != nil {
            cell.caloris.text = "\(menuArr[indexPath.row].calories!)"
    
        }else {
            
            cell.caloris.isHidden = true
            cell.faireLogoCaloreis.isHidden = true
            
        }
        
        return cell
    }
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
}

}
