
import UIKit
struct HungerStation {
var mealImage:UIImage
var theOfferH: String
var restaurantNameH : String
var mealTypeH: String
var DeliveryTimeH:String
var DeliveryPriceH:String
var TrackingH:String
var EvaluationH:String
var Logo: UIImage
}
class ViewController: UIViewController {
var arrayHS:[HungerStation] = []
var sendMealImage = UIImage(named: "A2")
var sendTheOffer = ""
var sendrestaurantName = ""
var sendmealType = ""
var sendDeliveryTime = ""
var sendDeliverPrice = ""
var sendTracking = ""
var sendEvaluation = ""
var sendlogo = UIImage(named:"Q1")


var R1 = HungerStation(mealImage:UIImage(named:"A1")!, theOfferH: "50%", restaurantNameH: "Herfy", mealTypeH: "Fast Food", DeliveryTimeH: "20-30", DeliveryPriceH: "30", TrackingH: "Live Tracking", EvaluationH:"3.8",Logo:UIImage(named:  "Logo1")!)
    
var R2 = HungerStation(mealImage: UIImage(named:"A2")!, theOfferH: "25%", restaurantNameH: "Mac", mealTypeH: "Fast Food", DeliveryTimeH: "10-30", DeliveryPriceH: "25", TrackingH: "Live Tracking", EvaluationH: "4.2",Logo:UIImage(named: "Logo2")!)
    
var R3 = HungerStation(mealImage: UIImage(named:"S3")!, theOfferH: "50%", restaurantNameH: "Dunkin", mealTypeH:"Donuts", DeliveryTimeH:"15-30",DeliveryPriceH: "20", TrackingH: "Live Tracking", EvaluationH:"3.5",Logo:UIImage(named:  "Logo3")!)
    

    
@IBOutlet weak var HungerStationTableView: UITableView!
    
var Data : HungerStation?
    
override func viewDidLoad() {
super.viewDidLoad()
HungerStationTableView.delegate = self
HungerStationTableView.dataSource = self
arrayHS = [R1,R2,R3]


}
override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
    let detailsVC = segue.destination as! ViewControllerTwo
//detailsVC.imageTwo = sendMealImage
detailsVC.nameTwo = sendrestaurantName
detailsVC.mealTwo = sendmealType
detailsVC.DeliveryTimeTwo = sendDeliveryTime
detailsVC.DeliveryPriceTwo = sendDeliverPrice
detailsVC.TheOfferTwo = sendTheOffer
detailsVC.EvaluationTwo = sendEvaluation
detailsVC.imageTwo = sendMealImage
//detailsVC.LogoTwo = //sendlogo
}

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayHS.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)  as! DataTVCell
    
cell.ImageHungerStion.image = arrayHS[indexPath.row].mealImage
    
cell.theOffer.text = arrayHS[indexPath.row].theOfferH
cell.RestauranName.text = arrayHS[indexPath.row].restaurantNameH
cell.MealType.text = arrayHS[indexPath.row].mealTypeH
cell.Evaluation.text = arrayHS[indexPath.row].EvaluationH
cell.DeliveryTime.text = arrayHS[indexPath.row].DeliveryTimeH
cell.DeliveryPrice.text = arrayHS[indexPath.row].DeliveryPriceH
cell.LogOne.image = arrayHS[indexPath.row].Logo
    
return cell
    }
    
//func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //return "MySimple Hunger Station App"
//}
//func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    //return "end"
//}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
    
    sendMealImage = arrayHS[indexPath.row].mealImage
    sendTheOffer = arrayHS[indexPath.row].theOfferH
    sendrestaurantName = arrayHS[indexPath.row].restaurantNameH
    sendmealType = arrayHS[indexPath.row].mealTypeH
    sendDeliveryTime = arrayHS[indexPath.row].DeliveryTimeH
    sendDeliverPrice = arrayHS[indexPath.row].DeliveryPriceH
    sendTracking = arrayHS[indexPath.row].TrackingH
    sendEvaluation = arrayHS[indexPath.row].EvaluationH

    Data = arrayHS[indexPath.row]
performSegue(withIdentifier: "GoTo", sender: self)
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}


