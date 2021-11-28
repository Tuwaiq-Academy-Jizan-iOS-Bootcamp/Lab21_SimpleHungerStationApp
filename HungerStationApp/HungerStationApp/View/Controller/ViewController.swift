//
//  ViewController.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 10/04/1443 AH.
//

import UIKit
//view controller one

class ViewController: UIViewController {

    @IBOutlet weak var pictureRestrantTableView: UITableView!
    var restrants = Restrunt.restrants
    var menu = Restrunt.restrants[0].menuOfRestruant
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureRestrantTableView.delegate = self
        pictureRestrantTableView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataRestruant = segue.destination as! MenuRestruantData
        dataRestruant.menuRest = menu
        

    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restrants.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pictureRestrantTableView.dequeueReusableCell(withIdentifier: "restruantCell") as! TheRestruantCell
        cell.deliverySAR.text = restrants[indexPath.row].delevriSAR
        cell.nameOfRestruant.text = restrants[indexPath.row].name
        cell.timerToTake.text = restrants[indexPath.row].timeToTake
        cell.tyoeOfFood.text = restrants[indexPath.row].typeOfTheFoods
        cell.timeOfClose.text = restrants[indexPath.row].closeRestruant
        cell.evlationCustomer.text = String(restrants[indexPath.row].evaluation)
        cell.restrantImage.image = UIImage(named: restrants[indexPath.row].imageRestrant)
        cell.logoImage.image = UIImage(named: restrants[indexPath.row].imageLogo)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        menu = Restrunt.restrants[indexPath.row].menuOfRestruant
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 300
            }
}
