import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var restorantsTabelView: UITableView!
    var restorants = Restorant.restorant
    var menuSender = Restorant.restorant[0].menu
    override func viewDidLoad() {
        super.viewDidLoad()
        restorantsTabelView.delegate = self
        restorantsTabelView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toMenu = segue.destination as? FoodMenu
        toMenu?.menu = menuSender
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  restorants.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restorantsTabelView.dequeueReusableCell(withIdentifier: "cell") as! FoodsCell
        cell.logo.image = UIImage(named: restorants[indexPath.row].logo)
        cell.restorandFoodImage.image = UIImage(named: restorants[indexPath.row].restorantName)
        cell.restorantName.text = restorants[indexPath.row].restorantName
        if restorants[indexPath.row].priceCondition != nil {
            cell.priceCondition.text = "  \(restorants[indexPath.row].priceCondition!)       "
        }else{
            cell.priceCondition.removeFromSuperview()
        }
        cell.foodType.text = restorants[indexPath.row].foodType
        cell.raiting.text = "\(restorants[indexPath.row].stars)"
        cell.deliveryAndOtherThings.text = "\(restorants[indexPath.row].minemumTimeOfDelivery) - \(restorants[indexPath.row].maximumTimeOfDelivery) minutes | Delivery Price \(restorants[indexPath.row].deliveryPrice)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menuSender = restorants[indexPath.row].menu
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    
}

