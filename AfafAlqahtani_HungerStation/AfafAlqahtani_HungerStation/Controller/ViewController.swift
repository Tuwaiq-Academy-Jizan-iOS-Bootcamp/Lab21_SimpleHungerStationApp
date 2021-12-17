//
//  ViewController.swift
//  AfafAlqahtani_HungerStation
//
//  Created by Afaf Yahya on 12/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
//    Swip
    @IBOutlet weak var swipeImages: UIImageView!
    var swipe = 0
    var swaipeImage = ["images-2","image1","image2","image3"]
    @IBAction func rightSwip(_ sender: Any) {
       
        if swipe < swaipeImage.count - 1 {
            swipe += 1
        } else {
            swipe = 0
        }
        swipeImages.image = UIImage(named: swaipeImage[swipe])
    }
    
  
    @IBAction func leftSwip(_ sender: Any) {
        if swipe > 0 {
            swipe -= 1
        } else {
            swipe = swaipeImage.count - 1
        }
        swipeImages.image = UIImage(named: swaipeImage[swipe] )
        
    }
    
    @IBOutlet weak var resturantTabelView: UITableView!
    var resturants = [RestorantsData]()
    var selectedIResturant:RestorantsData?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resturantTabelView.delegate = self
        resturantTabelView.dataSource = self
        getData()
    }
    func getData() {
        if let url = URL(string: "https://hungerstation-api.herokuapp.com/api/v1/restaurants") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let jsonRestorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let restorant = try decorder.decode(Restorants.self, from: jsonRestorantData)
                            print(restorant)
                            self.resturants = restorant.data
                            DispatchQueue.main.async {
                                self.resturantTabelView.reloadData()
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let send = segue.destination as! ConnectingOfViewController
    send.selectedMenue = selectedIResturant
}
    
//    to exit button
    @IBAction func rootViewController(segue: UIStoryboardSegue){
        print("Unwind to Root ViewController")
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellViewController
        cell.titleNameView.text = resturants[indexPath.row].name
        cell.subTitleView.text = resturants[indexPath.row].category
        cell.timerView.text =  "\(resturants[indexPath.row].delivery.time.min)-\(resturants[indexPath.row].delivery.time.min) minutes | \(resturants[indexPath.row].delivery.cost.value) \(resturants[indexPath.row].delivery.cost.currency) "
        cell.trackingView.text = resturants[indexPath.row].offer?.value
        cell.evaluationView.text = String(resturants[indexPath.row].rating)
        cell.trackingView.text = "Live Tracking"
        if resturants[indexPath.row].offer != nil {
              let value = resturants[indexPath.row].offer?.value
              let spend = resturants[indexPath.row].offer?.spend
              
              cell.offirView.text = value! + " (spend \(spend!) SAR"

//            styl to offer label
            let path = UIBezierPath()
            path.move(to: .zero)
            path.addLine(to: CGPoint(x:cell.offirView.bounds.width+33, y: 0))
            path.addLine(to: CGPoint(x:cell.offirView.bounds.width, y: 30))
            path.addLine(to: CGPoint(x: 0, y: 30))
            let shape = CAShapeLayer()
            shape.path = path.cgPath
            
//
            cell.offerLabel.layer.mask = shape
          }else {
              cell.promtoedLabel?.removeFromSuperview()
              cell.offirView?.removeFromSuperview()
              cell.offerLabel?.removeFromSuperview()
              
//             Resturant Image
          }
        cell.largeImageView.image = nil
        if let imageURL = URL(string: resturants[indexPath.row].image) {
            DispatchQueue.global().async {
                 let datta = try? Data(contentsOf: imageURL)
                if let datta = datta {
                    let image = UIImage(data: datta)
                            DispatchQueue.main.async {
                                if tableView.cellForRow(at: indexPath) != nil {
                                    cell.largeImageView.image = image
                                }
                                
                           }
                }
            }
        }
        
//        Logo Image
        cell.smaleImageView.image = nil
        if let imageURL = URL(string: resturants[indexPath.row].resturant_image) {
            DispatchQueue.global().async {
                 let datta = try? Data(contentsOf: imageURL)
                if let datta = datta {
                    let image1 = UIImage(data: datta)
                            DispatchQueue.main.async {
                                if tableView.cellForRow(at: indexPath) != nil {
                                    cell.smaleImageView.image = image1
                                }
                                
                           }
                }
            }
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         selectedIResturant = resturants[indexPath.row]
        performSegue(withIdentifier: "goToCillViewController", sender: self)
        resturantTabelView.deselectRow(at: indexPath, animated: true)
    }
}

