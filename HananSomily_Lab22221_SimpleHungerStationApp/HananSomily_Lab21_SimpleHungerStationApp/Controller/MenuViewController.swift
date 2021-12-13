//
//  menuViewController.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 16/11/2021.
//

import Foundation
import UIKit


class MenuViewController:UIViewController {
    @IBOutlet weak var attributeView: UIView!
    {
        didSet{
            attributeView.layer.masksToBounds = true
            attributeView.layer.cornerRadius = 5
//            let path = UIBezierPath()
//            path.move(to: CGPoint(x: 200, y: 200)) //StartPoint
//            path.addLine(to: CGPoint(x: 380, y: 380)) //EndPoint of First Line and StartPoint for Second Line
//            path.addLine(to: CGPoint(x: 20, y: 380)) //EndPoint of Second Line
//   attributeView.layer.masksToBounds = true
//   attributeView.layer.cornerRadius = 60
        }
    }
    @IBOutlet weak var scroolView1: NSLayoutConstraint!
    @IBOutlet weak var scroolView2: NSLayoutConstraint!
    @IBOutlet weak var scroolImage: NSLayoutConstraint!

//    // var coverHeightConstraint.constant = 0
    var largeNavigateBarHeight:CGFloat = 0
    var previousOFFsetState:CGFloat = 0
    var hightView :CGFloat = 0
    @IBOutlet weak var viewDetels: UIView! {
        didSet{
            viewDetels.layer.masksToBounds = true
            viewDetels.layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var stackOfferView: UIStackView!
    @IBOutlet weak var tagImageOffer: UIImageView!
    @IBAction func ExitBotton(_ sender: UIButton) {
       // exit(2)
    }
  
    @IBOutlet weak var photoResturantImage: UIImageView!
    @IBOutlet weak var logoSellectImage: UIImageView!
    @IBOutlet weak var nameResturantLabel: UILabel!
    @IBOutlet weak var levelResturantLabel: UILabel!
    @IBOutlet weak var descriptionResturantLabel: UILabel!
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
        
        
//        attributeView.layer.cornerRadius = 0.1 * attributeView.bounds.size.height
//        hightView = attributeView.bounds.size.height
        
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
                stackOfferView.isHidden = true
            }
        }
        let id = selected?.id
//print(id)
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
 if let value = content.calories {
    cell.caloresLabel.text = "\(value)"
 }else {
     cell.caloresLabel.isHidden = true
     cell.cloresImage.isHidden = true
 }
        cell.backgroundView?.layer.cornerRadius = 5
        cell.backgroundView?.clipsToBounds = true
        
        //cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
        {
            let verticalPadding: CGFloat = 10

            let maskLayer = CALayer()
            maskLayer.cornerRadius = 20
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 5 , dy: verticalPadding/2)
            cell.layer.mask = maskLayer
        }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        if   scrollView.contentOffset.y>0 {
//            if attributeView.bounds.size.height > viewDetels.bounds.size.height * 1.1{
//               let ofStet = largeNavigateBarHeight - scrollView.contentOffset.y
//                   let  constHeight = scroolView1.constant + ofStet
//                    scroolView1.constant = constHeight
//
//           print("ssss:\(scrollView.contentOffset.y)")
//        let ofStetImage = previousOFFsetState - scrollView.contentOffset.y
//       // preSetOfStateImage = scrollView.contentOffset.y
//        let constHeightImage = scroolImage.constant + ofStetImage
//        scroolImage.constant = constHeightImage
//            }
//        }
//        else {
//            if attributeView.bounds.size.height <= hightView {
//            let ofStet = largeNavigateBarHeight - scrollView.contentOffset.y
//                let  constHeight = scroolView1.constant + ofStet
//                 scroolView1.constant = constHeight
//
//        print("ssss:\(scrollView.contentOffset.y)")
//     let ofStetImage = previousOFFsetState - scrollView.contentOffset.y
//     let constHeightImage = scroolImage.constant + ofStetImage
//            scroolImage.constant = constHeightImage
//            }
//
////        if scrollView.contentOffset.y > (200 + largeNavigateBarHeight){
////            scroolView.constant = 0
////        }
////        let offSetDifrent = previousOFFsetState - scrollView.contentOffset.y
////
////        print("scroll view = \(scrollView.contentOffset.y)")
////        print("previous \(previousOFFsetState)")
////        print("difference \(offSetDifrent)")
////        previousOFFsetState = scrollView.contentOffset.y
////        let newHight = scroolView.constant + offSetDifrent
////        scroolView.constant = newHight
////    }
//}
//    }
}
