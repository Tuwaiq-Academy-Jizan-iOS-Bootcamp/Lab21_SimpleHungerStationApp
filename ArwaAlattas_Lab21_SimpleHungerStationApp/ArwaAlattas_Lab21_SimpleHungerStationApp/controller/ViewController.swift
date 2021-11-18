//
//  ViewController.swift
//  ArwaAlattas_Lab21_SimpleHungerStationApp
//
//  Created by Arwa Alattas on 10/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var resturantTableView: UITableView!{
        didSet{
            resturantTableView.delegate = self
            resturantTableView.dataSource = self
            
        }
        
        
    }
    var selectResturant: Resturant?
    var applebees = Resturant(name: "Applebee's", typefood: "Grills, American", image: "Applebees" , timeDilevry: "45 - 55 minutes", tracking: "Live Tracking ", star: "3,9",logo: "logoApplebees")
    var herfy = Resturant(name: "Herfy", typefood: "Fast Food", image: "Herfy", timeDilevry: "40 - 50 minutes", tracking: "Live Tracking ", star: "3,8",logo: "herfyLogo")
    var oceanBasket = Resturant(name: "Ocean Basket", typefood: "Sea Food", image: "OseanBasket", timeDilevry: "45 - 55 minutes", tracking: "Live Tracking ", star: "3,8",logo: "oceanbasketlogo")
    var resturants : [Resturant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resturants.append(applebees)
        resturants.append(herfy)
        resturants.append(oceanBasket)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Goto = segue.destination as! ResturantsViewController
        Goto.selectMenu = selectResturant
        
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! elementViewCell
        
        cell.resturantNameLabel.text = resturants[indexPath.row].name
        cell.TypeFoodLabel.text = resturants[indexPath.row].typefood
        cell.timeDelivryLabel.text = resturants[indexPath.row].timeDilevry
        cell.trackLabel.text = resturants[indexPath.row].tracking
        cell.starLabel.text = resturants[indexPath.row].star
        cell.resturantImageView.image = UIImage(named: resturants[indexPath.row].image)
        cell.resturantLogoImageView.image = UIImage(named: resturants[indexPath.row].logo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectResturant = resturants[indexPath.row]
        performSegue(withIdentifier: "GoToVC", sender: self)
    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
//        
////        view.
//        
//        
//        return view
//    }
    
    
}
