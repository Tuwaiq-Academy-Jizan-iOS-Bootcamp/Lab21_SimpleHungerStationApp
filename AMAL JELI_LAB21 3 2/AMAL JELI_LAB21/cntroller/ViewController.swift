//
//  ViewController.swift
//  AMAL JELI_LAB21
//
//  Created by Amal Jeli on 10/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var delivaryFood = [RestorantsData]()
    var LogoView1 = UIImage(named: "")
    var SelectBackground1 = UIImage(named: "")
    var nameOfResturant11 = ""
    var StarLable11:Double = 0.0
    var classificationResturant11 = ""
    var priceLabel11 = ""
    var minutesLabel11 = ""
    var selectRestaurant : RestorantsData?
    
    @IBOutlet weak var headrImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
getData(with:"/restaurants")

    }
    
    @IBAction func Backbutton(segue:UIStoryboardSegue){
        print("")
    }
    
    var swipeArr = ["img1","img2","img3","img4"]
   
                var index = 0
    @IBAction func swapLeft(_ sender: Any) {
            index -= 1
        if index < 0 {
            index = 3
        }
            headrImage.image = UIImage(named: swipeArr[index])
                       }
    @IBAction func swapRaight(_ sender: Any) {
             index += 1
         if index > 3 {
             index = 0
         }
        headrImage.image = UIImage(named: swipeArr[index])
                   }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let details = segue.destination as! DetailsViewController
        details.select = selectRestaurant
    }
        func getData(with endPoint:String){
            print("Is this called")
            let baseURL = ("https://hungerstation-api.herokuapp.com/api/v1")
        
            // 1. create url
            if let url = URL(string: baseURL + endPoint) {
                print("WAS THE URL IN CORRECT FORMAT")
                //2. create a URL Session
                let session = URLSession(configuration: .default)
                //3 create a task
                // task divenatin send data requset and response
                let task = session.dataTask(with: url) { data, response, error in
                    
                    if let error = error {
                        print("ERROR",error.localizedDescription)
                    }else {
                        print("DO WE HAVE DATA",data)
                        
                        
if let safeData = data {
                        
do {
  let decoder = JSONDecoder()
                                
   let decodedData = try decoder.decode(Restorants.self, from: safeData)
//    self.delivaryFood = decodedData.data
   DispatchQueue.main.async {
//   self.tableView.reloadData()
       self.delivaryFood = decodedData.data
       self.tableView.reloadData()
                                }
                            
                                
       } catch {
       print("SOMETHING WENT WRONG",error.localizedDescription)
                            }
                            
                        }
                        
                        
                    }
                    
                    
                }
                
                
                //4. start/resume the task
                task.resume()
            }
        }
    }

        // TODO: - navigate to details screen
extension ViewController:UITableViewDelegate,UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delivaryFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
//        cell.imageFood.image = delivaryFood[indexPath.row].
        cell.nameResturantLabel.text = delivaryFood[indexPath.row].name
        cell.classificationFoodLabel.text = delivaryFood[indexPath.row].category
        cell.processingTimeLabel.text = "\(delivaryFood[indexPath.row].delivery.time)"
        cell.foodDeliveryLabel.text = "\(delivaryFood[indexPath.row].delivery.cost.value),\(delivaryFood[indexPath.row].delivery.cost.currency)"
//        cell.liveTracking.text = "\(delivaryFood[indexPath.row].delivery.cost.value)"
        cell.restaurantEvaluation.text = "\(delivaryFood[indexPath.row].rating)"
//        cell.offerLabel.text = "\(delivaryFood[indexPath.row].offer)"
//        cell.promotedLabel.text = "\(delivaryFood[indexPath.row].)"
        
    
        if delivaryFood[indexPath.row].offer != nil {
            let value = delivaryFood[indexPath.row].offer?.value
            let spend = delivaryFood[indexPath.row].offer?.spend
            
            cell.offerLabel.text = value! + " (spend \(spend!) SAR"
            
            cell.offerLabel.sizeToFit()
             let path = UIBezierPath()
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width + 50 , y: 0))
                path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width, y: 40))
                path.addLine(to: CGPoint(x: 0, y: 40))

                let shape = CAShapeLayer()
                shape.path = path.cgPath

                cell.viewOffer.layer.mask = shape
            
        }else{
            cell.promotedLabel?.isHidden = true
            cell.offerLabel?.isHidden = true
            cell.viewOffer?.isHidden = true
        }
        
            
            
    cell.imageFood.image = nil
    if let imageURL = URL(string: delivaryFood[indexPath.row].image) {
    DispatchQueue.global().async {
    let datta = try? Data(contentsOf: imageURL)
    if let datta = datta {
    let image = UIImage(data: datta)
    DispatchQueue.main.async {
    if tableView.cellForRow(at: indexPath) != nil {
    cell.imageFood.image = image
         }
                                                                                 
     }
            }
           }
        }
     cell.logoo.image = nil
  if let imageURL = URL(string: delivaryFood[indexPath.row].resturant_image) {
DispatchQueue.global().async {
   let datta = try? Data(contentsOf: imageURL)
   if let datta = datta {
 let image1 = UIImage(data: datta)
DispatchQueue.main.async {
    if tableView.cellForRow(at: indexPath) != nil {
      cell.logoo.image = image1
              }
                                                                                 
     }
       }
          }
        }
    
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRestaurant = delivaryFood[indexPath.row]
//        performSegue(withIdentifier: "details", sender: delivaryFood[indexPath.section])
        performSegue(withIdentifier: "details", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
