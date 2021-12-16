//
//  ConnectingOfViewController.swift
//  AfafAlqahtani_HungerStation
//
//  Created by Afaf Yahya on 12/04/1443 AH.
//

import Foundation
import UIKit

class ConnectingOfViewController: UIViewController {
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
    @IBOutlet weak var imageOfoffer: UIImageView!
    @IBOutlet weak var viewOfmenueInformation: UIView!
    @IBOutlet weak var exetButton: UIButton!
  
    var selectedIResturant: MenusData?
    var selectedMenue: RestorantsData?
    var menues: [MenusData] = []
    
    override func viewDidLoad() {
        super .viewDidLoad()
        menueOfTabelView.delegate = self
        menueOfTabelView.dataSource = self
        
        
//        Styl corner to the view and exet button
        self.viewOfmenueInformation.layer.cornerRadius = 15
        self.exetButton.layer.cornerRadius = 20
        
//        Shadow To Label
        viewOfmenueInformation.layer.shadowOffset = CGSize(width: 10,
                                          height: 10)
        viewOfmenueInformation.layer.shadowRadius = 5
        viewOfmenueInformation.layer.shadowOpacity = 0.3
    
     
//
        if let menue = selectedMenue{
            resturantTitle.text = "\(menue.name)"
            subTitleView2.text = "\(menue.category)"
            timerView2.text = "\(menue.delivery.time.min) | \(menue.delivery.time.max) minutes"
            evaluationView2.text = "\(menue.rating)"
            priceView2.text = "\(10) SR"
            diliveryPrice.text = "\(20) SR"
            
//            Restorant Image
            imageViewMenue.image = nil
            if let imageL = URL(string: menue.image){
                DispatchQueue.global().async {
                    let data0 = try? Data(contentsOf: imageL)
                    if let data = data0 {
                        let imge2 = UIImage(data: data)
                        DispatchQueue.main.async {
                                self.imageViewMenue.image = imge2
                    }
            }
                }
            }
//            Logo Image
            smallImageMenueView.image = nil
            if let imageL = URL(string: menue.resturant_image){
                DispatchQueue.global().async {
                    let data0 = try? Data(contentsOf: imageL)
                    if let data = data0 {
                        let imge2 = UIImage(data: data)
                        DispatchQueue.main.async {
                                self.smallImageMenueView.image = imge2
                    }
            }
                }
            }
//            Offer Optional
            if menue.offer != nil {
                let value = menue.offer?.value
                let spend = menue.offer?.spend
                offerView2.text = value! + "\(spend!)"
            }else {
                offerView2?.removeFromSuperview()
                imageOfoffer.isHidden = true
            }
            
            
            menueOfTabelView.reloadData()
            getData(menue.id)

        }
        }
    
   
    func getData(_ id:Int) {
        if let url = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let jsonRestorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let menusInfo = try decorder.decode(Menus.self, from: jsonRestorantData)
                            print(menusInfo)
                            self.menues = menusInfo.menu
                            DispatchQueue.main.async {
                                self.menueOfTabelView.reloadData()
                            }
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }

}

extension ConnectingOfViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menues.count
    }
    
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CellViewController
        cell2.mealName.text = menues[indexPath.row].subtitle
        cell2.mealPrice.text = "\(menues[indexPath.row].price)"
        cell2.mealName.text = menues[indexPath.row].title
        cell2.mealPrice.text = "\(menues[indexPath.row].price.value) SR"
// calories
        if menues[indexPath.row].calories != nil {
            cell2.caloriesLabel.text = "\(menues[indexPath.row].calories!)"

                }else{
                cell2.caloriesLabel.isHidden = true
                cell2.flameLabel.isHidden = true
                }
//discriptionOfmeal (subtitle)
        if let subtitle = menues[indexPath.row].subtitle {
            cell2.discriptionOfmeal.text = "\(subtitle)"
        }else {
            cell2.discriptionOfmeal.isHidden = true
        }
      
        if let imageurl = URL(string: menues[indexPath.row].image) {
            DispatchQueue.global().async {
                 let datta = try? Data(contentsOf: imageurl)
                if let datta = datta {
                    let image2 = UIImage(data: datta)
                            DispatchQueue.main.async {
                                if tableView.cellForRow(at: indexPath) != nil {
                                    cell2.mealImageView.image = image2
                                }
                                
                           }
                }
            }
        }
        return cell2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    }
