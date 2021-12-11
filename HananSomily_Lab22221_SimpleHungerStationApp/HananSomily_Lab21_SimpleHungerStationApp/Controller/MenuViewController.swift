//
//  menuViewController.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 16/11/2021.
//

import Foundation
import UIKit
//struct MenuResturant {
//    var menuPhoto : UIImage
//    var menuName : String
//    var numePrice : String
//}

class MenuViewController:UIViewController {
    
    @IBOutlet weak var tagImageOffer: UIImageView!
    @IBAction func ExitBotton(_ sender: UIButton) {
       // exit(2)
    }
    @IBOutlet weak var photoResturantImage: UIImageView!
    @IBOutlet weak var logoSellectImage: UIImageView!
    @IBOutlet weak var nameResturantLabel: UILabel!
    @IBOutlet weak var levelResturantLabel: UILabel!
    @IBOutlet weak var descriptionResturantLabel: UILabel!
    @IBOutlet weak var caloresLabel: UILabel!
    @IBOutlet weak var priceDeleveryLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    
    @IBOutlet weak var detelsOffers: UILabel!
    @IBOutlet weak var menuResturantTabelView: UITableView! {
        didSet{
            menuResturantTabelView.delegate = self
            menuResturantTabelView.dataSource = self
        }
    }
    var selected:DataAPI?

    var menuSelect:[Menu] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let item = selected{
            print("******\(item.image)")
//photoResturantImage.image = item.image
if let imageURL = URL(string:item.image){
        DispatchQueue.global().async {
               let data = try? Data(contentsOf: imageURL)
               if let data = data {
                   let image = UIImage(data: data)
                   DispatchQueue.main.async {
                       self.photoResturantImage.image = image

                   }
                 }
               }
            //  cell.imageProperties.maximumSize = CGSize(width: 60, height: 60)
             }
            //logoSellectImage.image = item.resturant_image
            if let imageURL = URL(string:item.resturant_image){
                    DispatchQueue.global().async {
                           let data = try? Data(contentsOf: imageURL)
                           if let data = data {
                               let image = UIImage(data: data)
                               DispatchQueue.main.async {
                                   self.logoSellectImage.image = image

                               }
                             }
                           }
                        //  cell.imageProperties.maximumSize = CGSize(width: 60, height: 60)
                         }
            nameResturantLabel.text = item.name
            levelResturantLabel.text = "\(item.rating)"
            descriptionResturantLabel.text = item.category
            deliveryTimeLabel.text = "\(item.delivery.time.max) - \(item.delivery.time.min) Minutes"
            //"\(item.delivery.cost.value)\(item.delivery.cost.currency)"
            //caloresLabel.text = item.
            if let value = item.offer  {
                detelsOffers.text = " \(value.value)(Spend \(value.spend) SAR)"
                
            } else {
                detelsOffers.isHidden = true
                tagImageOffer.isHidden = true
            }
            caloresLabel.text = "35 SAR"
        }
        var id = selected?.id
print(id)
        getDtaaAPI(with: "/\(id!)")
}
    func getDtaaAPI(with endpoint:String){
    let link = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
        print(link)
        if let url = URL(string: link + endpoint){
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error",error.localizedDescription)
                }else {
                    print("we have data",data)
                    if let safeData = data{
                        do{
                        let decoder = JSONDecoder()
let decodedData = try decoder.decode(MenuData.self, from: safeData)
                            DispatchQueue.main.async {
                self.menuSelect = decodedData.menu
                self.menuResturantTabelView.reloadData()
                            }
                        print("decoded data", decodedData)
                    }catch {
                      }
                   }
                }
            }
            task.resume()
    }
    }
}

extension MenuViewController:UITableViewDelegate {
    
}
extension MenuViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return menuSelect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell" )as! MuneTableViewCell
        //StructureHungerStation
        let content = menuSelect[indexPath.row]
        cell.menuNameLabel.text = content.title
        if let value = content.subtitle {
        cell.menuDiscriptionLabel.text = value
        }else{
            cell.menuDiscriptionLabel.isHidden = true
        }
        cell.menuPriceLabel.text = " \(content.price.value)\(content.price.currency)"
        if let imageURL = URL(string:menuSelect[indexPath.row].image){
    DispatchQueue.global().async {
           let data = try? Data(contentsOf: imageURL)
           if let data = data {
               let image = UIImage(data: data)
               DispatchQueue.main.async {
                   cell.menuImage.image = image
                   
               }
             }
           }
        //  cell.imageProperties.maximumSize = CGSize(width: 60, height: 60)
         }
        //cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
