//
//  ViewController.swift
//  Lab21
//
//  Created by زهور حسين on 10/04/1443 AH.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    
   
    @IBOutlet weak var imageheder: UIImageView!
    
    @IBOutlet weak var tableviewOne: UITableView! {
        didSet{
            tableviewOne.delegate = self
            tableviewOne.dataSource = self
        }
    }
    var arrayresturent : [Resturant] = []
    var selectresturent : Resturant?
    var swiparray = ["face1","face2","face3","face4"]
    var index = 0
    //var selectresturentinfo = selectresturent
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view.
        getData(with: "/restaurants")
    }
    func getData(with endpoint:String){
        print("Is this called??")
        let baseURL = "https://hungerstation-api.herokuapp.com/api/v1"
        
        if let ur1 = URL(string: baseURL + endpoint) {
            print("WAS THE IN CORRECT FORMAT")
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: ur1) { data, response, error in
                if let error = error {
                    print("ERROR" , error.localizedDescription)
                }else{
                    
                    if let safeData = data {
                        print("DO WE HAVE DATA",String(data: safeData, encoding: .utf8))
                        do {
                            let decoder = JSONDecoder()
                            
                            let decodedData = try decoder.decode(ResturantResponse.self,from: safeData)
                            
                            DispatchQueue.main.async {
                                
                                self.arrayresturent = decodedData.data
                                self.tableviewOne.reloadData()
                            }
                            //  print("DECOD DATA", decodedData[0]
                        }catch{
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        }
                    }
                    
                }
            }
            
            task.resume()
        }
    }

     @IBAction func remove(_ sender: UIStoryboardSegue) {
       }

override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    let send = segue.destination as! viewControllerTableview2
    send.selectresturent = selectresturent
}
    
    
    
    
    @IBAction func swipright(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = 3
        }
        imageheder.image = UIImage(named: swiparray[index])
    }
    
    @IBAction func swiplift(_ sender: Any) {
        index += 1
        if index > 3 {
            index = 0
        }
        imageheder.image = UIImage(named: swiparray[index])
    }
}

 extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayresturent.count
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         selectresturent = arrayresturent[indexPath.row]
         performSegue(withIdentifier: "segue", sender: self)
         tableView .deselectRow(at: indexPath, animated: true)
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableviewOne.dequeueReusableCell(withIdentifier: "cell") as! cellviewcontoroller
    
    cell.restaurantname.text = arrayresturent[indexPath.row].name
        if arrayresturent[indexPath.row].is_promoted == true {
            cell.restaurantadvertising.text = "promoted"

        } else {
            cell.restaurantadvertising.isHidden = true
        }
        cell.restaurantname.text = arrayresturent[indexPath.row].name
        cell.restaurantrating.text = arrayresturent[indexPath.row].category
        cell.timedelivery.text = "\(arrayresturent[indexPath.row].delivery.time)"
        cell.restaurantevaluation.text = "\(arrayresturent[indexPath.row].rating)"
            
            
         
        
    if let imageURL = URL(string: arrayresturent[indexPath.row].image){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imageResturentbig.image = img
                    }
                }
            }
        }
              
//        func tableView(_tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 500
//        }
//
        // cell.logoimage.image = nil
        if let imageURL = URL(string: arrayresturent[indexPath.row].resturant_image){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let img2 = UIImage(data: data)
                    DispatchQueue.main.async {
                        
                        cell.logoimage.image = img2
                    }
                }
            }
        if let v = arrayresturent[indexPath.row].offer {
            cell.restaurantdiscount.text = "\(v.value ) spend \(v.spend)sar"
            cell.restaurantdiscount.sizeToFit()
let path = UIBezierPath()
            path.move(to:.zero)
            path.addLine(to: CGPoint(x:cell.restaurantdiscount.bounds.width+50 ,y: 0))
         path.addLine(to: CGPoint(x:cell.restaurantdiscount.bounds.width, y: 25))
         path.addLine(to: CGPoint(x: 0,y: 25))
         let shape = CAShapeLayer()
         shape.path = path.cgPath
            shape.fillColor = UIColor.systemBlue.cgColor
            cell.viewoflable.layer.addSublayer(shape)
            cell.viewoflable.addSubview(cell.restaurantdiscount)
        }else{
            cell.restaurantdiscount?.isHidden = true
        }
            
//            cell.restaurantdiscount.sizeToFit()
//let path = UIBezierPath()
//            path.move(to:.zero)
//            path.addLine(to: CGPoint(x:cell.restaurantdiscount.bounds.width+50 ,y: 0))
//         path.addLine(to: CGPoint(x:cell.restaurantdiscount.bounds.width, y: 40))
//         path.addLine(to: CGPoint(x: 0,y: 40))
//         let shape = CAShapeLayer()
//         shape.path = path.cgPath
//            shape.fillColor = UIColor.systemBlue.cgColor
//            cell.viewoflable.layer.addSublayer(shape)
        }
            

         return cell
     }
 
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 200
     }
 }
