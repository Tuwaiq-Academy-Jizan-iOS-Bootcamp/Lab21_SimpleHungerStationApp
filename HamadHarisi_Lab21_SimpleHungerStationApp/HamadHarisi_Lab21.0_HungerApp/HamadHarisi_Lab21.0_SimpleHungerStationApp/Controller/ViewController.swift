//
//  ViewController.swift
//  HamadHarisi_Lab21.0_SimpleHungerStationApp
//
//  Created by حمد الحريصي on 15/11/2021.
//
import Foundation
import UIKit
//@MainActor class ViewController: UIViewController
class ViewController: UIViewController
{
    @IBOutlet weak var restrantTableView: UITableView!

        var restorants: Restorants = Restorants(data: [])
        var idSender = 0
        var backImageSender = ""
        let restorantsURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
        override func viewDidLoad()
    {
            super.viewDidLoad()
            restrantTableView.delegate = self
            restrantTableView.dataSource = self
            downloadRestorantData(restorantsURL)
            restrantTableView.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: "recell")
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
            let toMenu = segue.destination as? FoodMenu
            toMenu?.restorantsId = idSender
            toMenu?.restorantBackImage = backImageSender
    }
    func downloadRestorantData(_ FromURL: String)
    {
            if let urlData = URL(string: FromURL)
        {
                let urlSession = URLSession(configuration: .default)
                let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
                    if let error = error
                    {
                    print("ERRORR1", error.localizedDescription)
                    }
                    else
                    {
                    if let restorantData = data
                        {
                            do
                            {
                            let decorder = JSONDecoder()
                            self.restorants = try decorder.decode(Restorants.self, from: restorantData)
                            DispatchQueue.main.async
                                {
                                self.restrantTableView.reloadData()
                                }
                        }
                        catch
                        {
                        print("ERRORR2", error.localizedDescription)
                            }
                        }
                    }
                }
            urlTask.resume()
            }
        }
    }

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return restorants.data.count
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 380
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = restrantTableView.dequeueReusableCell(withIdentifier: "cell") as! FoodsCell
            cell.restorantNameLabel.text = restorants.data[indexPath.row].name
            if restorants.data[indexPath.row].offer != nil {
                if let offer = restorants.data[indexPath.row].offer {
                    if offer.value.contains("%") {
                        cell.priceConditionLabel.text = "\(offer.value)Your Order(spend \(offer.spend) SR)"
                    }else {
                        cell.priceConditionLabel.text = "\(offer.value)(spend \(offer.spend) SR)"
                    }
                }
            }else{
                cell.priceConditionLabel.isHidden = true
            }
            if restorants.data[indexPath.row].is_promoted == true {
                cell.promotedLabel.text = "Promoted"
            }else{
                cell.promotedLabel.isHidden = true
            }
            cell.foodsTypeLabel.text = restorants.data[indexPath.row].category
            cell.raitingLabel.text = "\(restorants.data[indexPath.row].rating)"
    cell.deliveryLabel.text = " \(restorants.data[indexPath.row].delivery.time.min) - \(restorants.data[indexPath.row].delivery.time.max) minutes | Delivery: \(restorants.data[indexPath.row].delivery.cost.value)\(restorants.data[indexPath.row].delivery.cost.currency) |"
            if let restorantlogo = URL(string: restorants.data[indexPath.row].image) {
                DispatchQueue.global().async {
                    if let restorantlogo = try? Data(contentsOf: restorantlogo) {
                        let logo = restorantlogo
                        DispatchQueue.main.async {
                            cell.restorantFoodImage.image = UIImage(data: logo)
                        }
                    }
                }
            }
            if let restorantBackImage = URL(string: restorants.data[indexPath.row].resturant_image) {
                DispatchQueue.global().async {
                    if let restorantBackImage = try? Data(contentsOf: restorantBackImage) {
                        let backImage = restorantBackImage
                        DispatchQueue.main.async
                        {
                        cell.restorantlogoImage.image = UIImage(data: backImage)
                        }
                    }
                }
            }
        
           
         
            return cell
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            idSender = restorants.data[indexPath.row].id
            performSegue(withIdentifier: "toVC2", sender: self)
        }
    }







//    var restaurants:Restorants = Restorants(data: [])
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//
//        APIManager.shared.getData(endPoint: "/restaurants") { [self] rest in
//            self.restaurants = rest
//            DispatchQueue.main.async {
//            self.foodTableView.reloadData()
//    }
//    }
//}
//}
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//}
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        restaurants.data.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier:"ReuseCell", for: indexPath) as! restrantCell
//        cell.foodType.text = restaurants.data[indexPath.row].category
//        cell.restrantName.text = restaurants.data[indexPath.row].name
//        cell.restrantImage.loadImageUsingCache(with: restaurants.data[indexPath.row].image)
//
//        return cell
//    }
//
//
//}

