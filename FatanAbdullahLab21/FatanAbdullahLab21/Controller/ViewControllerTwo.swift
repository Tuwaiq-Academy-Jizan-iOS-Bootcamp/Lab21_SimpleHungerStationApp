import Foundation
import UIKit
class ViewControllerTwo:UIViewController {
@IBOutlet weak var RimageVT: UIImageView!
@IBOutlet weak var nameRVT: UILabel!
@IBOutlet weak var MealTypeVT: UILabel!
@IBOutlet weak var DeliveryPriceVT: UILabel!
@IBOutlet weak var DeliveryTimeVT: UILabel!
@IBOutlet weak var TheOfferVT: UILabel!
@IBOutlet weak var EvaluationVT: UILabel!
@IBOutlet weak var LogoTwo: UIImageView!
    
@IBOutlet weak var tableViewT: UITableView!
//@IBOutlet weak var MealName: UILabel!
//@IBOutlet weak var PriceMeal: UILabel!
//@IBOutlet weak var imageMeal: UIImageView!
    //var FoodMenu [Menu] = []
var imageTwo = UIImage(named: "A1")
var nameTwo = ""
var mealTwo = ""
var DeliveryTimeTwo = ""
var DeliveryPriceTwo = ""
var TheOfferTwo = ""
var EvaluationTwo = ""
var logoTwo = ""
    
var r1 = [Menu(NameMeal: "Burger Large Size", MealPrice: "20", MealImage: "H1"),Menu(NameMeal: "Burger chicken medium ", MealPrice: "25", MealImage: "H2")]
    
    var r2 = [Menu(NameMeal: "Combo Chicken burger", MealPrice: "20", MealImage: "M2"),Menu(NameMeal: "Combo Grilled Chicken Large Size", MealPrice: "25", MealImage: "M3")]
    
    var r3 = [Menu(NameMeal: "Dunkin Donuts", MealPrice: "20", MealImage: "D1"),Menu(NameMeal: "Fancies", MealPrice: "25", MealImage: "D2")]
    
var menus:[Menu] = []
    
override func viewDidLoad() {
    super.viewDidLoad()
//arrayMenu = [r1,r2,r3]

    tableViewT.dataSource = self
    tableViewT.dataSource = self
RimageVT.image = imageTwo 
nameRVT.text = nameTwo
MealTypeVT.text = mealTwo
DeliveryPriceVT.text = DeliveryPriceTwo
DeliveryTimeVT.text = DeliveryTimeTwo
TheOfferVT.text = TheOfferTwo
EvaluationVT.text = EvaluationTwo
    
if nameRVT.text == "Herfy"{
        menus = r1
    }else if  nameRVT.text == "Mac"{
        menus = r2
    }else{
        menus = r3
    }
    
}
}

extension ViewControllerTwo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableViewT.dequeueReusableCell(withIdentifier: "CellTwo",for:indexPath) as! DataTVCell
    cell.MealName.text = menus[indexPath.row].NameMeal
    cell.PriceMeal.text = menus[indexPath.row].MealPrice
    cell.imageMeal.image = UIImage(named: menus[indexPath.row].MealImage)
    
    return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
  
    
}
