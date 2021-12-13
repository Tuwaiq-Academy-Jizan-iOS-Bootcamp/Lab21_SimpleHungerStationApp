//
//  ViewController.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//

import UIKit
import Foundation
//class PlaceholderCell: UITableViewCell {
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .white
//        selectionStyle = .none
//
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 10)
//        layer.shadowRadius = 10.0
//        layer.shadowOpacity = 0.5
//        layer.masksToBounds = false
//        clipsToBounds = false
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//}

class ViewController: UIViewController {
   
 
    @IBOutlet weak var collectonImageView: UICollectionView! {
        didSet{
            collectonImageView.delegate = self
            collectonImageView.dataSource = self
        }
    }
    var sectionName = "Hunger Station"
    var i = 0
    var resturant:[DataAPI] = []
    //["aselBorger","borgerKing","herfy"]
    var select :DataAPI?
    @IBOutlet weak var hungerStationTableView: UITableView! {
        didSet {
            hungerStationTableView.delegate = self
            hungerStationTableView.dataSource = self
//            hungerStationTableView.layer.shouldRasterize = true
//            hungerStationTableView.layer.shadowColor = .init(gray: 54, alpha: 32)
        
        }
    }
    
    var foodHungerStation:[DataAPI] = []
   // var resturent:HungerStationAPI
    override func viewDidLoad() {
        super.viewDidLoad()
        

        getDtaaAPI(with: "/restaurants")
//resturant = [UIImage(named:"borgerKing")!,UIImage(named: "aselBorger")!,UIImage(named: "herfy")!]

    }
    func getDtaaAPI(with endpoint:String){
    let link = "https://hungerstation-api.herokuapp.com/api/v1"
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
let decodedData = try decoder.decode(HungerStationAPI.self, from: safeData)
                            DispatchQueue.main.async {
                self.foodHungerStation = decodedData.data
                self.hungerStationTableView.reloadData()
                                self.resturant = decodedData.data
                                self.collectonImageView.reloadData()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let send = segue.destination as! MenuViewController
         send.selected = select
        
    }
    @IBAction func backTo(segue:UIStoryboardSegue){
        
    }
}

extension ViewController :UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //foodHungerStation.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodHungerStation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! ClassHungerStationTableView
        //StructureHungerStation
//        cell.layer.masksToBounds = true
//        cell.layer.mask

let content = foodHungerStation[indexPath.row]
        //print()
//        cell.layer.masksToBounds = true
//        cell.layer.cornerRadius = 20
        cell.viewDetelCell.layer.masksToBounds = true
        cell.viewDetelCell.layer.cornerRadius = 12

        cell.backgroundView?.layer.cornerRadius = 5
        cell.backgroundView?.clipsToBounds = true
       
        
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale

cell.nameMealLabel.text = content.name
cell.descriptionMealLabel.text = content.category
 cell.deliverCostLabel.text = "\(content.delivery.cost.value)\(content.delivery.cost.currency)"
 cell.deliveryTimeLabel.text = "\(content.delivery.time.max) - \(content.delivery.time.min) Minutes"
        cell.evaluationLabel.text = "\(content.rating)"
if let value = content.offer  {
    cell.offerLabel.text = "\(value.value)(Spend \(value.spend) SAR)"
    cell.offerLabel.sizeToFit()
    print(cell.offerLabel.bounds.width)
    let path = UIBezierPath()
    path.move(to: .zero)
    path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width+50 , y: 0))
    path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width, y: 30))
    path.addLine(to: CGPoint(x: 0, y: 30))

    let shape = CAShapeLayer()
    shape.path = path.cgPath

    cell.offerViewShape.layer.mask = shape
    
   // cell.offerViewShape.sizeToFit()

} else {
    cell.offerLabel.isHidden = true
    cell.offerViewShape.isHidden = true
}
        
let resturantImage = URL(string:foodHungerStation[indexPath.row].image)
     // print(resturantImage)
    if let resturantImage = resturantImage {
          DispatchQueue.global().async {
              if let data = try? Data(contentsOf: resturantImage) {
                  DispatchQueue.main.async {
                      if self.hungerStationTableView.cellForRow(at: indexPath) != nil {
                          cell.imageMeal.image = UIImage(data: data)
                      }
         }
       }
     }
   }
//        content.imageProperties.maximumSize = CGSize(width: 50, height: 50)
        if let resturantLogoImage = URL(string:foodHungerStation[indexPath.row].resturant_image){
            print(resturantLogoImage)
                DispatchQueue.global().async {
           let data = try? Data(contentsOf: resturantLogoImage)
           if let data = data {
               let image = UIImage(data: data)
               DispatchQueue.main.async {
                   cell.logoImage.image = image
                   
               }
             }
           }
         }
        if content.is_promoted == true {
            cell.promotedLable.text = "Promoted"

        } else {
            cell.promotedLable.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        select = foodHungerStation[indexPath.row]
        performSegue(withIdentifier: "sender", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
        return "Hunger Station"
    }
//    func tableView(_ tableView: UITableView, viewForHeader section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 40))
//        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
//        view.backgroundColor = .systemYellow
//        label.text = sectionName
//        label.textColor = .white
//        label.textAlignment = .center
//        view.addSubview(label)
//        return view
//    }
//    func tableView(_ tableView: UITableView, heightForHeader section: Int) -> CGFloat {
//        return 70
//    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return " .. End .."
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
    
}
extension ViewController:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resturant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgeView", for: indexPath) as! ImageViewCell
        if let resturantLogoImage = URL(string:foodHungerStation[indexPath.row].image){
            print(resturantLogoImage)
                DispatchQueue.global().async {
           let data = try? Data(contentsOf: resturantLogoImage)
           if let data = data {
               let image = UIImage(data: data)
               DispatchQueue.main.async {
                   cell.viewPannar.image = image
                   
               }
             }
           }
         }
//        cell.viewPannar.image = resturant[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
