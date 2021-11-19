//
//  ViewController.swift
//  AfafAlqahtani_HungerStation
//
//  Created by Afaf Yahya on 12/04/1443 AH.
//

import UIKit
//structure to resturant information
struct HungerStayion{
    var titleName: String
    var subTitle: String
    var largeimage: String
    var smalimage: String
    var timer: String
    var tracking: String
    var evaluation: String
    var offer: String
    var delivery: String
//structure to a menue of resturantes
}


class ViewController: UIViewController {
    @IBOutlet weak var resturantTabelView: UITableView!
    
    var resturants = [HungerStayion(titleName: "Herfi", subTitle: "Fast Food", largeimage: "Herfy", smalimage: "Logohiefi", timer: "45_60",tracking:"Life Trakcing", evaluation: "3.9", offer: "5 SAR Delivery (spend 35 SAR)", delivery: "5SR")
                      
                      , HungerStayion(titleName: "Littlel Ceasar", subTitle: "Pizza", largeimage: "LittlelCeasar", smalimage: "Logolittlecaesars", timer: "40_60", tracking:"Life Trakcing",evaluation: "4.5", offer: "50.0 % off your order (spend 35 SAR)",delivery: "Delivery 10 SR")
                      
                      ,HungerStayion(titleName: "Broccoli", subTitle: "Pasta", largeimage: "Broccoli", smalimage: "Logobroccoly", timer: "40_60", tracking:"Life Trakcing", evaluation: "4", offer: "40.0 % off your order (spend 35 SAR)",delivery: "Delivery 15 SR")]
//    ____________________________________________________
    
   
    var selectedIResturant: HungerStayion?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resturantTabelView.delegate = self
        resturantTabelView.dataSource = self
        
      //  resturants.append(resturant)
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let send = segue.destination as! ConnectingOfViewController
    send.selectedIResturant = selectedIResturant
}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.titleNameView.text = resturants[indexPath.row].titleName
        cell.subTitleView.text = resturants[indexPath.row].subTitle
        cell.largeImageView.image = UIImage(named: resturants[indexPath.row].largeimage)
        cell.smaleImageView.image = UIImage(named:resturants [indexPath.row].smalimage)
        cell.timerView.text = resturants[indexPath.row].timer
        cell.trackingView.text = resturants[indexPath.row].tracking
        cell.evaluationView.text = resturants[indexPath.row].evaluation
        cell.offirView.text = resturants[indexPath.row].offer
        cell.deliveryView.text = resturants[indexPath.row].delivery

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         selectedIResturant = resturants[indexPath.row]
        performSegue(withIdentifier: "goToCillViewController", sender: self)
        resturantTabelView.deselectRow(at: indexPath, animated: true)
    }
}


