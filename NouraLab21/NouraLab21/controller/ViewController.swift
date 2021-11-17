//
//  ViewController.swift
//  NouraLab21
//
//  Created by NoON .. on 10/04/1443 AH.
//

import UIKit
struct Hungerstation {
    var resturantImage: String
    var logoImage: String
    var resturantName: String
    var typeFood: String
    var time: String
    var deliveryChrge: String
    var starResturant: String
    var minimum: String
   var menu: [Menu]
}
class ViewController: UIViewController {
    @IBOutlet weak var headrImage: UIImageView!
    @IBOutlet weak var hungerstationTableView: UITableView!
    {
        didSet {
            hungerstationTableView.delegate = self
            hungerstationTableView.dataSource = self
        }
    }
    var resturants:[Hungerstation] = []
    var resturants1 = Hungerstation(resturantImage: "1", logoImage: "logo1", resturantName: "Herfy", typeFood: "Fast Food", time: "40-50 minutes", deliveryChrge: "50.0% Off Your order(Spend 35 SR)", starResturant: "3.8", minimum: "35 SR", menu: [Menu(productName: "Combo Big Herfy With Cheese Medium Size", price: "24 SR", productImage: "H1"),Menu(productName: "Combo Super Herfy Medium Size", price: "30 SR", productImage: "H2"),Menu(productName: "Combo Spicy Musahab Large Size", price: "24 SR", productImage: "H3"),Menu(productName: "Combo Regular Musahab Large Size", price: "24 SR", productImage: "H4")])
    var resturants2 = Hungerstation(resturantImage: "2",logoImage: "logo2", resturantName: "DUNKIN", typeFood: "Coffee", time: "30-40 minutes", deliveryChrge: "5 SR Deliver(Spend 35 SR)", starResturant: "2.8", minimum: "35 SR", menu: [Menu(productName: "Munchkins Mix Box", price: "15 SR", productImage: "D1"),Menu(productName: "Banana Choco Chip", price: "11 SR", productImage: "D3"),Menu(productName: "Iced Caramel Macchiato", price: "14 SR", productImage: "D2"),Menu(productName: "Labnah Honey Toast", price: "14 SR", productImage: "D4")])
    var resturants3 = Hungerstation(resturantImage: "3",logoImage: "logo3", resturantName: "Baskin Robbins", typeFood: "Drinks-bakery-candy", time: "30-40 minutes", deliveryChrge: "5 SR Deliver(Spend 35 SR", starResturant: "4.8", minimum: "35 SR", menu: [Menu(productName: "Happiness Pac", price: "119 SR", productImage: "B1"),Menu(productName: "Single Value Scoop Cup", price: "14 SR", productImage: "B2"),Menu(productName: "Thick Shake Bottle Large Size", price: "31 SR", productImage: "B3"),Menu(productName: "Triple Junior Scoops Sundae Cup", price: "28 SR", productImage: "B4")])
    var selectedHungerstation:Hungerstation?
    var selecteMenu:[Menu] = []
    var imageView = ["view","V1","V2","V3","V5","V6"]
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        resturants.append(resturants1)
        resturants.append(resturants2)
        resturants.append(resturants3)

      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let sendData = segue.destination as! MenuViewController
    sendData.selectedHungerstation = selectedHungerstation
}
    
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
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue){      print("Unwind to Root View Controller")
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! DataTableViewCell
        cell.restaurantNameLabel.text = resturants[indexPath.row].resturantName
        cell.typeFoodLabel.text = resturants[indexPath.row].typeFood
        cell.deliveryChargeLabel.text = resturants[indexPath.row].deliveryChrge
        cell.timeLabel.text = resturants[indexPath.row].time
        cell.restaurantRatingLable.text = resturants[indexPath.row].starResturant
        cell.deliveryChargeLabel.text = resturants[indexPath.row].deliveryChrge
        cell.foodImage.image = UIImage(named: resturants[indexPath.row].resturantImage)
        cell.logoImage.image = UIImage(named: resturants[indexPath.row].logoImage)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt
    indexPath: IndexPath)
    -> CGFloat {
    return 250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectedHungerstation = resturants[indexPath.row]
        performSegue(withIdentifier: "goTo2", sender: self)
    }
}


