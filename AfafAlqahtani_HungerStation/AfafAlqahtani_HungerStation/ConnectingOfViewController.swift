//
//  ConnectingOfViewController.swift
//  AfafAlqahtani_HungerStation
//
//  Created by Afaf Yahya on 12/04/1443 AH.
//

import Foundation
import UIKit
struct ResturantMenue{
    var meal : String
    var price : String
    var mealImage: String
}
class ConnectingOfViewController: UIViewController {
//    @IBOutlet weak var viewDetalse: CellViewController!
    @IBOutlet weak var viewDetales: UIView!
    @IBOutlet weak var imageViewMenue: UIImageView!
    @IBOutlet weak var smallImageMenueView: UIImageView!
    @IBOutlet weak var menueOfTabelView: UITableView!
    @IBOutlet weak var resturantTitle: UILabel!
    @IBOutlet weak var evaluationView2: UILabel!
    @IBOutlet weak var priceView2: UILabel!
    @IBOutlet weak var diliveryPrice: UILabel!
    @IBOutlet weak var timerView2: UILabel!
    @IBOutlet weak var subTitleView2: UILabel!
    @IBOutlet weak var offerView2: UILabel!
    
    
    
//    var selectedIResturant: HungerStayion?
//    var menue:  [ResturantMenue] = []
    
    var herfy: [ResturantMenue] = [ResturantMenue(meal: "Duble Burgir meal", price: "27 SR", mealImage: "dublle"),ResturantMenue( meal: "Herfy Burger meal", price: "19 SR", mealImage: "burger"),ResturantMenue(meal: "chilli Chikcen meal", price: "19 SR", mealImage: "chilli"), ResturantMenue(meal: "Kids Burger meal", price: "15", mealImage: "kidsBurger"),ResturantMenue(meal: "Kids Nuggest meal", price: "15", mealImage: "kidsNuggest")]

    var littlelCeasar: [ResturantMenue] = [ResturantMenue(meal: "Chickin Fajitas Pizza", price: "20 SR", mealImage: "fajitasPizza"),ResturantMenue(meal: "Indian Pizza", price: "20 SR", mealImage: "indianPizza"),ResturantMenue(meal: "Meet Pizza", price: "20 RS", mealImage: "meetPizza"),ResturantMenue(meal: "Meet Pizza", price: "20 SR", mealImage: "meetPizza"),ResturantMenue(meal: "Ranch Pizza", price: "20 SR", mealImage: "ranchPizza"),ResturantMenue(meal: "Mix Pizza", price: "20 SR", mealImage: "mixPizza")]
    
    var broccoli : [ResturantMenue] = [ResturantMenue(meal: "Broccoli Pasta", price: "30 SR", mealImage: "broccoliPasta"), ResturantMenue(meal: "Vegetable Pasta", price: "30 SR", mealImage: "vegetablePasta"),ResturantMenue(meal: "lasangna", price: "40 SR", mealImage: "Lasangna"),ResturantMenue(meal: "Pepperoni Pasta", price: "30 SR", mealImage: "pepperoni"),ResturantMenue(meal: "srimpPasta", price: "40 SR", mealImage: "shrimpPasta")]

    var selectedIResturant: HungerStayion?
    var selectedMenue: ResturantMenue?
    var menue:  [ResturantMenue] = []
    override func viewDidLoad() {
        super .viewDidLoad()
        menueOfTabelView.delegate = self
        menueOfTabelView.dataSource = self
        
        
        if let selectedMenue = selectedIResturant {
            resturantTitle.text = selectedMenue.titleName
            timerView2.text = selectedMenue.timer
            priceView2.text = selectedMenue.evaluation
            diliveryPrice.text = selectedMenue.delivery
            evaluationView2.text = selectedMenue.evaluation
            offerView2.text = selectedMenue.offer
            imageViewMenue.image = UIImage(named: selectedMenue.largeimage)
            smallImageMenueView.image = UIImage(named: selectedMenue.smalimage)
        
        }
        if resturantTitle.text == "Herfi" {
            menue = herfy
        }
        if resturantTitle.text == "Littlel Ceasar" {
            menue = littlelCeasar
        }
        if resturantTitle.text == "Broccoli" {
        menue = broccoli
        }
    }
}
extension ConnectingOfViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CellViewController
        cell2.mealName.text = menue[indexPath.row].meal
        cell2.mealPrice.text = menue[indexPath.row].price
        cell2.mealImageView.image = UIImage(named: menue[indexPath.row].meal)
        return cell2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    }
