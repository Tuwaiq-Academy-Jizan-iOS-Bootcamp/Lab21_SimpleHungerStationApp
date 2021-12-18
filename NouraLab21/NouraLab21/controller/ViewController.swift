//
//  ViewController.swift
//  NouraLab21
//
//  Created by NoON .. on 10/04/1443 AH.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var headrImage: UIImageView!
    @IBOutlet weak var hungerstationTableView: UITableView!
    {
        didSet {
            hungerstationTableView.delegate = self
            hungerstationTableView.dataSource = self
        }
    }
    var selectedHungerstation:RestorantsData?
   var imageView = ["view","V1","V2","V3","V5","V6"]
   var index = 0
    var dataRestorants1 = [RestorantsData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadRestorantData()
        // navigation bar
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationItem.backBarButtonItem = backBarButtonItem
        navigationController!.navigationBar.titleTextAttributes = [
                   .foregroundColor: UIColor.white,
                   ]
    }
    // Steps url
    func downloadRestorantData() {
        if let UrlRestorantData = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants") {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: UrlRestorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let restorantsInfo = try decorder.decode(Restorants.self, from: restorantData)
                            print(restorantsInfo.data)
                            self.dataRestorants1 = restorantsInfo.data
                            DispatchQueue.main.async {
                                self.hungerstationTableView.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    // code segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let sendData = segue.destination as! MenuViewController
        sendData.selectedHungerstation = selectedHungerstation
    }
    // code hedar "Swip"
    @IBAction func swipeRight(_ sender: Any) {
        if index < imageView.count - 1 {
            index += 1
        } else {
            index = 0
        }
        headrImage.image = UIImage(named: imageView[index])
    }
    @IBAction func swipeLeft(_ sender: Any) {
        if index > 0 {
            index -= 1
        } else {
            index = imageView.count - 1
        }
        headrImage.image = UIImage(named: imageView[index] )
    }
    // action the button
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue){
        print("Unwind to Root View Controller")
    }
}
// extension VC1
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataRestorants1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! DataTableViewCell
        cell.restaurantNameLabel.text = dataRestorants1[indexPath.row].name
        cell.typeFoodLabel.text = dataRestorants1[indexPath.row].category
        cell.restaurantRatingLable.text = "\(dataRestorants1[indexPath.row].rating)"
        // delivery "Time"
        cell.timeLabel.text = "\(dataRestorants1[indexPath.row].delivery.time.max) - \(dataRestorants1[indexPath.row].delivery.time.min) Minutes"
        // delivery "Cost"
        cell.costLabel.text =
        "\(dataRestorants1[indexPath.row].delivery.cost.currency) \(dataRestorants1[indexPath.row].delivery.cost.value)"
        // offer
        if  dataRestorants1[indexPath.row].offer != nil {
            let value = dataRestorants1[indexPath.row].offer?.value
            let spend = dataRestorants1[indexPath.row].offer?.spend
            cell.deliveryChargeLabel.text = "\(value!) "+"(Spend \(spend!) SR)"
        }else {
            cell.deliveryChargeLabel?.removeFromSuperview()
        }
        //promoted
        if dataRestorants1[indexPath.row].is_promoted == false {
            cell.promoted?.removeFromSuperview()
        }
        // code shape
        if dataRestorants1[indexPath.row].offer != nil {
            let bezierPath = UIBezierPath()
        bezierPath.move(to: .zero)
            bezierPath.addLine(to: CGPoint(x: cell.deliveryChargeLabel.bounds.width + 50, y: 0))
        bezierPath.addLine(to: CGPoint(x: cell.deliveryChargeLabel.bounds.width + 35, y: 25))
        bezierPath.addLine(to: CGPoint(x: 0, y: 25))
        let shape = CAShapeLayer()
            shape.path = bezierPath.cgPath
            shape.fillColor = UIColor.systemBlue.cgColor
        cell.deliveryView.layer.addSublayer(shape)
            cell.deliveryView.sizeToFit()
        }else{
            cell.deliveryView.isHidden = true
        }
        //code image
        cell.foodImage.image = nil
        if let imageF = URL(string: dataRestorants1 [indexPath.row].image){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageF)
                if let data = data {
                    let imge0 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil{
                        cell.foodImage.image = imge0
                }
            }
        }
            }
        }
        cell.logoImage.image = nil
        if let imageL = URL(string: dataRestorants1 [indexPath.row].resturant_image){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageL)
                if let data = data {
                    let imge1 = UIImage(data: data)
                    DispatchQueue.main.async {
                        if tableView.cellForRow(at: indexPath) != nil{
                        cell.logoImage.image = imge1
                }
            }
        }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt
                   indexPath: IndexPath)
    -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedHungerstation = dataRestorants1[indexPath.row]
        performSegue(withIdentifier: "goTo2", sender: self)        
    }
}


