////
////  DetaileViewController.swift
////  DahmaJaber_MiniHungerStition
////
////  Created by dahma alwani on 14/04/1443 AH.
////
//
import Foundation
import UIKit

class DetaileViewController : UIViewController {

    @IBOutlet weak var viewImageLarge: UIImageView!
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var typeFood: UILabel!
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var minimumOrder: UILabel!
    @IBOutlet weak var deleveryPrise: UILabel!
    @IBOutlet weak var deliveryTime: UILabel!
    @IBOutlet weak var starLabe: UILabel!
    @IBOutlet weak var offerDetalilsLabel: UILabel!
    @IBOutlet weak var detailsView: UIView!
    
    var id = 0
    var selectedIResturant: RestorantsData?
    var selectedMenue: MenusData?
    var menues: [MenusData] = []
       override func viewDidLoad() {
           super .viewDidLoad()
           detailsTableView.delegate = self
           detailsTableView.dataSource = self
           
//           let detailsView = UIView()
//           detailsView.layer.shadowColor = UIColor.gray.cgColor
//           detailsView.layer.shadowOpacity = 1
//           detailsView.layer.shadowOffset = .zero
//           detailsView.layer.shadowRadius = 0.5
//           detailsView.layer.shadowPath = UIBezierPath(rect: detailsTableView.bounds).cgPath
//           detailsView.layer.shouldRasterize = true
//           detailsView.layer.rasterizationScale = UIScreen.main.scale
           
           if let menue = selectedIResturant{
               nameFood.text = "\(menue.name)"
               typeFood.text = "\(menue.category)"
               deliveryTime.text = "\(menue.delivery.time.min) \(menue.delivery.time.max)"
               deleveryPrise.text = "\(30 ) SR"
               minimumOrder.text = "\(10) SR"
               starLabe.text = "\(menue.rating)"
//               offerDetalilsLabel.text = "\(menue.offer?.value)"
//               offerDetalilsLabel.removeFromSuperview()

               viewImageLarge.image = nil
               if let imageL = URL(string: menue.image){
                   DispatchQueue.global().async {
                       let data0 = try? Data(contentsOf: imageL)
                       if let data = data0 {
                           let imge2 = UIImage(data: data)
                           DispatchQueue.main.async {
                                   self.viewImageLarge.image = imge2
                       }
               }
                   }
               }
               logoImage.image = nil
               if let imageL = URL(string: menue.resturant_image){
                   DispatchQueue.global().async {
                       let data0 = try? Data(contentsOf: imageL)
                       if let data = data0 {
                           let imge2 = UIImage(data: data)
                           DispatchQueue.main.async {
                                   self.logoImage.image = imge2
                       }
               }
                   }
               }
               if menue.offer != nil {
                   let value = menue.offer?.value
                   let spend = menue.offer?.spend
                   offerDetalilsLabel.text = value! + "\(spend!)"
               }else {
                   deleveryPrise?.removeFromSuperview()
               }
               detailsTableView.reloadData()
               id = menue.id
               getData()
           }
       }
       func getData() {
           print("HELLO?")
           if let url = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(id)") {
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { data, response, error in
                   if let error = error {
                       print("Error", error.localizedDescription)
                   }else {
                       if let jsonRestorantData = data {
                           do {
                               let decorder = JSONDecoder()
                               let menusInfo = try decorder.decode(Menus.self, from: jsonRestorantData)
                               print("MENU",menusInfo)
                               self.menues = menusInfo.menu
                               DispatchQueue.main.async {
                                   self.detailsTableView.reloadData()
                               }
                           }catch {
                               print("Wrong", error.localizedDescription)
                           }
                       }
                   }
               }
               task.resume()
           }
       }
}
   extension DetaileViewController: UITableViewDelegate, UITableViewDataSource{
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return menues.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cellMenu = tableView.dequeueReusableCell(withIdentifier: "cellOfMenu", for: indexPath) as! CellMinue
           cellMenu.firstTitleLabel.text = menues[indexPath.row].title
           cellMenu.priceLable.text = "\(menues[indexPath.row].price.value) \( menues[indexPath.row].price.currency))"

                   if let subtitle = menues[indexPath.row].subtitle {
                       cellMenu.discribtionLabel.text = "\(subtitle)"
                   }else {
                       cellMenu.discribtionLabel.isHidden = true
                   }

                   if let calories = menues[indexPath.row].calories {
                       cellMenu.caloriesLabel.text = "\(calories)"
                   }else {
                       cellMenu.caloriesLabel.isHidden = true
                   }
//           if let calories = menues[indexPath.row].calories {
//               cellMenu.caloriesUIImageView.image = UIImage.
//           }else {
//               cellMenu.caloriesUIImageView.isHidden = true
//           }
           if let imageurl = URL(string: menues[indexPath.row].image) {
               DispatchQueue.global().async {
                    let datta = try? Data(contentsOf: imageurl)
                   if let datta = datta {
                       let image2 = UIImage(data: datta)
                               DispatchQueue.main.async {
                                   if tableView.cellForRow(at: indexPath) != nil {
                                       cellMenu.imageMeal.image = image2
                                   }
                              }
                   }
               }
           }
           return cellMenu
       }

       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 80
       }
       }
