//
//  ViewController.swift
//  DahmaJaber_MiniHungerStition
//
//  Created by dahma alwani on 14/04/1443 AH.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var itemsTableView: UITableView!
//    offer view & label
//    @IBOutlet weak var offerView: UIView!
//    @IBOutlet weak var offerLabel: UILabel!
//    {
//        didSet{
//            offerLabel.text = ""
//            offerLabel.sizeToFit()
//        }
//    }
//    ..................
    var resturants = [RestorantsData]()
        var selectedResturant: RestorantsData?
        override func viewDidLoad() {
            super.viewDidLoad()
            
            itemsTableView.delegate = self
            itemsTableView.dataSource = self
            getData("https://hungerstation-api.herokuapp.com/api/v1/restaurants")
                }
                func getData(_ FromURL: String) {
                    if let restorantData = URL(string: FromURL) {
                        let urlSession = URLSession(configuration: .default)
                        let task = urlSession.dataTask(with: restorantData) { data, response, error in
                            if let error = error {
                                print("error in url", error.localizedDescription)
                            }else {
                                if let jsonRestorantData = data {
                                    do {
                                        let decorder = JSONDecoder()
                                        let restorantsInfo = try decorder.decode(Restorants.self, from: jsonRestorantData)
                                        print(restorantsInfo)
                                        self.resturants = restorantsInfo.data
                                        DispatchQueue.main.async {
                                            self.itemsTableView.reloadData()
                                        }
                                    }catch {
                                        print("error", error.localizedDescription)
                                    }
                                }
                            }
                        }
                        task.resume()
                    }
                }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let send = segue.destination as! DetaileViewController
            send.selectedIResturant = selectedResturant
    }
    @IBAction func rootViewController(segue: UIStoryboardSegue){
            print("Unwind to Root ViewController")
        }

}

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return resturants.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellView
            cell.nameOfResturantLabel.text = resturants[indexPath.row].name
            cell.categoryLabel.text = resturants[indexPath.row].category
            cell.timeLable.text =  "\(resturants[indexPath.row].delivery.time.min) - \(resturants[indexPath.row].delivery.time.min) minutes | \(resturants[indexPath.row].delivery.cost.value) \(resturants[indexPath.row].delivery.cost.currency)"
            cell.trackingLable.text = "Live Tracking"
//            "\(String(describing: resturants[indexPath.row].offer?.value))"
//            cell.deliverayPriceLabel.text = resturants[indexPath.row].
            cell.ratingLable.text = String(resturants[indexPath.row].rating)
            
            if resturants[indexPath.row].offer != nil {
                        let value = resturants[indexPath.row].offer?.value
                        let spend = resturants[indexPath.row].offer?.spend
                        
                        cell.offerLabel.text = value! + "spend \(spend!) SAR"
                
                cell.offerLabel.sizeToFit()
                let path = UIBezierPath()
                            path.move(to: .zero)
                path.addLine(to: CGPoint(x:cell.offerLabel.bounds.width+33, y: 0))
                            path.addLine(to: CGPoint(x:cell.offerLabel.bounds.width, y: 30))
                            path.addLine(to: CGPoint(x: 0, y: 30))
                            let shape = CAShapeLayer()
                            shape.path = path.cgPath
                            cell.offerView.layer.mask = shape
                
                    }else {
                        cell.promotedLabel?.removeFromSuperview()
                        cell.offerView?.removeFromSuperview()
                        cell.offerLabel?.removeFromSuperview()
                        cell.offerLabel? .removeFromSuperview()                   
                    }
            cell.resturantImage.image = nil
            if let resturantImageUrl = URL(string: resturants[indexPath.row].image) {
                DispatchQueue.global().async {
                    let datta = try? Data(contentsOf: resturantImageUrl)
                    if let datta = datta {
                        let image = UIImage(data: datta)
                                DispatchQueue.main.async {
                                    if tableView.cellForRow(at: indexPath) != nil {
                                        cell.resturantImage.image = image
                                    }
                                    
                               }
                    }
                }
            }
            cell.logoImage.image = nil
            if let imageURL = URL(string: resturants[indexPath.row].resturant_image) {
                DispatchQueue.global().async {
                     let datta = try? Data(contentsOf: imageURL)
                    if let datta = datta {
                        let image1 = UIImage(data: datta)
                                DispatchQueue.main.async {
                                    if tableView.cellForRow(at: indexPath) != nil {
                                        cell.logoImage.image = image1
                                    }
                                    
                               }
                    }
                }
            }
            return cell
                }
   
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 350
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             selectedResturant = resturants[indexPath.row]
            performSegue(withIdentifier: "goToCillViewController", sender: self)
            itemsTableView.deselectRow(at: indexPath, animated: true)
        }

    }
