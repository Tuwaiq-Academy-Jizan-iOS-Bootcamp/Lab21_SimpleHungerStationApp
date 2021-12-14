////
////  RestrantMenu.swift
////  HamadHarisi_Lab21.0_SimpleHungerStationApp
////
////  Created by حمد الحريصي on 13/12/2021.
////
////
//import Foundation
//import UIKit
//
//class RestrantMenu: UIViewController
//{
//
//    @IBOutlet weak var restrantTableView: UITableView!
//
//
//    // @IBOutlet weak var menuTabelView: UITableView!
//   // @IBOutlet weak var backGroundImage: UIImageView!
//    var restorants: Restorants = Restorants(data: [])
//    let restorantsURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
//
//    var idSender = 0
//    var restorantBackImageSender = ""
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        restrantTableView.delegate = self
//        restrantTableView.dataSource = self
//           downloadRestorantData(restorantsURL)
//        restrantTableView.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: "cell")
//    }
//            func downloadRestorantData(_ FromURL: String) {
//                if let urlData = URL(string: FromURL) {
//                    let urlSession = URLSession(configuration: .default)
//                    let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
//                        if let error = error {
//                            print("The URL Is Not Working", error.localizedDescription)
//                        }else {
//                            if let restorantData = data {
//                                do {
//                                    let decorder = JSONDecoder()
//                                    self.restorants = try decorder.decode(Restorants.self, from: restorantData)
//                                    DispatchQueue.main.async {
//                                        self.restrantTableView.reloadData()
//                                    }
//                                }catch {
//                                    print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
//                                }
//                            }
//                        }
//                    }
//                    urlTask.resume()
//                }
//            }
//        }
//
//        extension RestrantMenu: UITableViewDelegate, UITableViewDataSource {
//            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//                return restorants.data.count
//            }
//            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                return 300
//            }
//            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//                let cell = restrantTableView.dequeueReusableCell(withIdentifier: "cell") as! FoodsCell
//                cell.restorantName.text = restorants.data[indexPath.row].name
//               // cell.timeLogoLabel.text = "􀣔"
//                if restorants.data[indexPath.row].offer != nil {
//                    if let offer = restorants.data[indexPath.row].offer {
//                        if offer.value.contains("%") {
//                            cell.priceCondition.text = "\(offer.value)Your Order(spend \(offer.spend) SR)     "
//                        }else {
//                            cell.priceCondition.text = "\(offer.value)(spend \(offer.spend) SR)     "
//                        }
//                    }
//                }else{
//                    cell.priceCondition.isHidden = true
//                }
//                if restorants.data[indexPath.row].is_promoted == true {
//                    cell.promoted.text = "Promoted"
//                }else{
//                    cell.promoted.isHidden = true
//                }
//                cell.foodType.text = restorants.data[indexPath.row].category
//                cell.raiting.text = "\(restorants.data[indexPath.row].rating)"
//                cell.deliveryAndOtherThings.text = " \(restorants.data[indexPath.row].delivery.time.min) - \(restorants.data[indexPath.row].delivery.time.max) minutes | Delivery: \(restorants.data[indexPath.row].delivery.cost.value)\(restorants.data[indexPath.row].delivery.cost.currency) |"
//                if let restorantlogo = URL(string: restorants.data[indexPath.row].resturant_image) {
//                    DispatchQueue.global().async {
//                        if let restorantlogo = try? Data(contentsOf: restorantlogo) {
//                            let logo = restorantlogo
//                            DispatchQueue.main.async {
//                                cell.logo.image = UIImage(data: logo)
//                            }
//                        }
//                    }
//                }
//                if let restorantBackImage = URL(string: restorants.data[indexPath.row].image) {
//                    DispatchQueue.global().async {
//                        if let restorantBackImage = try? Data(contentsOf: restorantBackImage) {
//                            let backImage = restorantBackImage
//                            DispatchQueue.main.async {
//                                cell.restorandFoodImage.image = UIImage(data: backImage)
//                            }
//                        }
//                    }
//                }
//
//
//
//                return cell
//            }
//            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//                idSender = restorants.data[indexPath.row].id
//                performSegue(withIdentifier: "toMenu", sender: self)
//            }
//        }
