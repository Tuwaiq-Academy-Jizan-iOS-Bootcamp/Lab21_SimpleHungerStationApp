//
//  ViewController.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 10/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itemTableVieww: UITableView!
    {
        didSet {
            
            itemTableVieww.delegate = self
            itemTableVieww.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func viewsegue(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let distenationVC = segue.destination as! DetailsViewController
        distenationVC.selectedItem = selectedItem
    }

    var data:[Item] = Item.data
    var selectedItem:Item?
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! ItemTableView
        
//        let image = UIImage(named: data[indexPath.row].imageName)
        cell.restaurantName.text = data[indexPath.row].title
        cell.typeFoods.text = data[indexPath.row].typeFood
        cell.timeDelivery.text = data[indexPath.row].deliveryTime
        cell.evaluationNamber.text = data[indexPath.row].evaluation
        cell.liveTracking.text = "Live Tracking"
        cell.itemImageView.image = UIImage(named: data[indexPath.row].imageName)
//        cell.accessoryType = .disclosureIndicator
//        cell.restaurantImage.image = UIImage(named: data[indexPath.row].imageName)
//        cell.restaurantNameLabel.text = data[indexPath.row].title
//        cell.DeliveryLabel.text = data[indexPath.row].deliveryCost
//        cell.DeliveryTimeLabel.text = data[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = data[indexPath.row]
        performSegue(withIdentifier: "VC2", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
}
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//        let headerView = UIImageView(image: hanger1)
//        let headerImage = UIImage(named: “hanger1”)!
//        headerView.frame = CGRect(x: 20, y: 35, width: 340, height: 80)
//        view.addSubview(headerView)
//       let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
//        label.textColor = UIColor.black
//        label.frame = CGRect(x: 10, y: 8, width: 200, height: 20)
//        view.addSubview(label)
//        return view
//        view.backgroundColor = .systemYellow
//        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 50))
////        label.text = sectionTitles[section]
//        label.textColor = .black
//      label.textAlignment = .center
//        view.addSubview(label)


//              label.text = “text”
//              label.font = UIFont(name:“Helvetica Neue” , size: 17)
    
//    }
//}
//func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//    return 200
//}
//func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "MY HANGERSTAION"
//    }
//
