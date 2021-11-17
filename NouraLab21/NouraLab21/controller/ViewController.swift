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
    var resturants:[Hungerstation] = []
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


