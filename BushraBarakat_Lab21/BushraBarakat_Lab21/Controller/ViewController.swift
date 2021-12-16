//
//  ViewController.swift
//  BushraBarakat_Lab21
//
//  Created by Bushra Barakat on 14/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resturantTableView: UITableView!
    @IBOutlet weak var headerImageView1: UIImageView!
    @IBOutlet weak var headerImageView2: UIImageView!
    @IBOutlet weak var headerImageView3: UIImageView!
    @IBOutlet weak var headerImageView4: UIImageView!
    
    
//    ..........swipe..........................
    var headerImage = 0
    var headerImages = ["header1", "header2", "header3"]
    
//    .........resturant model...............
    var resturantData = [ResturantData]()
    var selectResturant : ResturantData?
    
//    .........segue viewcontrollertwo.......
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let sender = segue.destination as! ViewControllerTwo
        sender.selectResturant = selectResturant
    }
    
    
    override func viewDidLoad() {
        
//    ..........head and tableview corner.....
    self.headerImageView1.layer.cornerRadius = 5
    self.headerImageView2.layer.cornerRadius = 5
    self.headerImageView3.layer.cornerRadius = 5
    self.headerImageView4.layer.cornerRadius = 5
    self.resturantTableView.layer.cornerRadius = 5
    
//    ..........resturant tableview .....................
    resturantTableView.dataSource = self
    resturantTableView.delegate = self
        
//    ...........call function fitch data...........
    getData()
    }
    
//    ...........swipe function................
    @IBAction func swipeRieghtHeaderImage(_ sender:Any) {
    if headerImage < headerImages.count - 1 {
        headerImage += 1
        headerImageView1.image = UIImage (named: headerImages[headerImage])
        }else{
        headerImage = 0
        headerImageView1.image = UIImage (named: headerImages[headerImage])
            
                 }
               }
    
//  ...............function back button bar.........
    @IBAction func backButtonBar(segue: UIStoryboardSegue) {
    }
    
//  ...............function fitch data..............
    func getData (){
        print("is this work")
        if let url = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants"){
            print("was the url in correct formate")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respose, error in
                if let error = error {
                    print("error",error.localizedDescription)
                }else{
                    print ("do we have data", data)
                    if let safeData = data{
                        print (String(data: safeData, encoding: .utf8))
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Resturant.self, from: safeData)
                            self.resturantData = decodedData.data
                            DispatchQueue.main.async {
                                
                                self.resturantTableView.reloadData()
                            }
                            print ("decodeadData", decodedData)
                        }catch{
                            print ("somthing went rong", String(describing: error))
                        }
                    }
                }
            }
            task.resume()
        }
    }

        
}
//   .................. display data .........................
    
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return resturantData.count
           }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
    
        cell.resturantImageView.loadImageUsingCache(with: resturantData[indexPath.row].image)
        
        cell.resturantLogoImageView.loadImageUsingCache(with: resturantData[indexPath.row].resturant_image)
        cell.resturantLogoImageView.layer.cornerRadius = 15
        
        cell.resturantNameLabel.text = resturantData[indexPath.row].name
        cell.resturantTypeLabel.text = resturantData[indexPath.row].category
        
        cell.resturantDeliveryTimeLabel.text = "\(resturantData[indexPath.row].delivery.time.min)-\(resturantData[indexPath.row].delivery.time.max)"
       
        cell.resturantDeliveryPriceLabel.text = "\(resturantData[indexPath.row].delivery.cost.value) \(resturantData[indexPath.row].delivery.cost.currency)"
    
        cell.resturantRatingLabel.text = "\(resturantData[indexPath.row].rating)"

        if resturantData[indexPath.row].offer != nil{
            let value = resturantData[indexPath.row].offer?.value
            let spend = resturantData[indexPath.row].offer?.spend
        cell.resturantDiscountLabel.text = value! + " (spend \(spend!) SAR)"
        }else{
        cell.resturantDiscountLabel.isHidden = true
        cell.resturantDescountView.isHidden = true
        }
        cell.resturantDiscountLabel.sizeToFit()
            let bezierPath = UIBezierPath()
            bezierPath.move(to:.zero )
            bezierPath.addLine(to: CGPoint(x: cell.resturantDiscountLabel.bounds.width+50, y: 0))
            bezierPath.addLine(to: CGPoint(x: cell.resturantDiscountLabel.bounds.width, y: 30))
            bezierPath.addLine(to: CGPoint(x: 0, y: 30))
            let shape = CAShapeLayer()
            shape.path = bezierPath.cgPath
        cell.resturantDescountView.layer.mask = shape
        
        cell.resturantPromoted.text = "\(resturantData[indexPath.row].is_promoted)"
        if resturantData[indexPath.row].is_promoted == true {
        cell.resturantPromoted.text = "promoted"
        }else{
        cell.resturantPromoted.isHidden = true
        }
       
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        cell.layer.shadowRadius = 8.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.10
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectResturant = resturantData[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 350

        }
}

    
    
    
    
    
    

