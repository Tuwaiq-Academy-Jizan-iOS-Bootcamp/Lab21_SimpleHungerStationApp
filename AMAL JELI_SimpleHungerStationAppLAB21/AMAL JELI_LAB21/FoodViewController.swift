//
//  ViewController.swift
//  AMAL JELI_LAB21
//
//  Created by Amal Jeli on 10/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delivaryFood = [Food]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        delivaryFood = [Food (imageFood1: UIImage(named:"Ocean basket")!, nameResturantLable1: "ocean basket", classificationFoodLabel1: "SeaFood", processingTimeLabel1: "40-50 minutes", foodDelivery1: "delivary 15 RS", liveTrackingLabel1: "liveTracking", restaurantEvaluation1: "3.8"),Food(imageFood1: UIImage(named: "Applebee's")!, nameResturantLable1: "Applebees", classificationFoodLabel1: "Grills,American", processingTimeLabel1: "45-50 minutes", foodDelivery1: "delivary10 RS", liveTrackingLabel1: "liveTracking", restaurantEvaluation1: "3.7"),Food(imageFood1:UIImage(named: "ToastIt")!, nameResturantLable1: "ToastIt", classificationFoodLabel1: "Fast Food", processingTimeLabel1: "30-40 minutes", foodDelivery1: "delivary 15 RS", liveTrackingLabel1: "liveTracking", restaurantEvaluation1: "4.4")]
        tableView.reloadData()
    }
//
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        // TODO: - navigate to details screen
    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        delivaryFood.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
        
        cell.imageFood.image = delivaryFood[indexPath.row].imageFood1
        cell.nameResturantLabel.text = delivaryFood[indexPath.row].nameResturantLable1
        cell.classificationFoodLabel.text = delivaryFood[indexPath.row].classificationFoodLabel1
        cell.processingTimeLabel.text = delivaryFood[indexPath.row].processingTimeLabel1
        cell.foodDeliveryLabel.text = delivaryFood[indexPath.row].foodDelivery1
        cell.liveTracking.text = delivaryFood[indexPath.row].liveTrackingLabel1
        cell.restaurantEvaluation.text = delivaryFood[indexPath.row].restaurantEvaluation1
        
        
        var delivary = delivaryFood[indexPath.row]
        //            delivary.imageProperties.maximumSize = CGSize(width: 40, height: 40)
        //
        cell.element(imageFood0:delivary.imageFood1 ,nameResturantLabel0:delivary.nameResturantLable1,classificationFoodLabel0:delivary.classificationFoodLabel1, processingTimeLabel0:delivary.processingTimeLabel1 , foodDeliveryLabel0:delivary.foodDelivery1, liveTracking0:delivary.liveTrackingLabel1 , restaurantEvaluation0:delivary.restaurantEvaluation1)
        
        //        .image = image
        //        var content = cell.defaultContentConfiguration()
        //        content.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        //
        //       var delivary = delivaryFood[indexPath.row]
        //        cell.imageFood.image
        //        = delivaryFood[indexPath.row].image
        //        delivary.image = UIImage(named:delivaryFood [indexPath.row].imageFood)
        //        delivary.nameResturantLabel.text = delivaryFood [indexPath.row]
        //    let image = UIImage(named: )
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "welcome"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "the End"
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "details", sender: delivaryFood[indexPath.section])
    }
    
}

