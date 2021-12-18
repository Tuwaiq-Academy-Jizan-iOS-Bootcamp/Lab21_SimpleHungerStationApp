//
//  ViewController.swift
//  ArwaAlattas_HungerStation
//
//  Created by Arwa Alattas on 07/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerimage: UIImageView!
    
    var  numberOfImages = 0
    var movingHeader = ["HungerStation1","hugerstation2","hungerstation2","hungerstation22"]
    
    @IBAction func moveToRight(_ sender: Any) {
        numberOfImages += 1
        if numberOfImages > movingHeader.count-1 {
            numberOfImages = 0
        }
        headerimage.image =  UIImage(named: movingHeader[numberOfImages])
    }
    
    @IBAction func moveToLeft(_ sender: Any) {
        numberOfImages -= 1
        if numberOfImages < 0 {
            numberOfImages = movingHeader.count-1
        }
        headerimage.image =  UIImage(named: movingHeader[numberOfImages])
    }
    
    
    
    
    @IBOutlet weak var resturantTableView: UITableView!{
        didSet{
            resturantTableView.delegate = self
            resturantTableView.dataSource = self
    
        }
    }
    
    var resturants : [Dataa] = []
    var selectResturant:Dataa?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIManager.shared.getData() { resturants in
            self.resturants = resturants.data
            DispatchQueue.main.async {
                self.resturantTableView.reloadData()
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let goto = segue.destination as! ResturantViewController
        goto.selectResturant = selectResturant
    }
    
    @IBAction func unwindToRootViewController(seque:UIStoryboardSegue){

    }
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ResturantView
        DispatchQueue.main.async {
            cell.nameOfResturant.text = self.resturants[indexPath.row].name
            cell.typeOfResturant.text = self.resturants[indexPath.row].category
            cell.rating.text = "\(self.resturants[indexPath.row].rating)"
            cell.tracking.text = "Live Tracking "
            cell.delevery.text = " \(self.resturants[indexPath.row].delivery.time.min)-\(self.resturants[indexPath.row].delivery.time.max) minutes  | \(self.resturants[indexPath.row].delivery.cost.value ) \(self.resturants[indexPath.row].delivery.cost.currency)"
            if let offer = self.resturants[indexPath.row].offer{
                cell.offerLabel.text = "\(offer.value) (Spend \(offer.spend) SAR)"
            }else{
                cell.offerLabel.isHidden = true
                cell.viewOfOffer.isHidden = true
            }
            
            cell.resturantLogo.loadImageUsingCache(with: self.resturants[indexPath.row].resturant_image)
            cell.resturantImage.loadImageUsingCache(with: self.resturants[indexPath.row].image)
            if self.resturants[indexPath.row].is_promoted == false{
                cell.promotedLabel.isHidden = true
            }
            
            
            cell.offerLabel.sizeToFit()
                   let path = UIBezierPath()
                   path.move(to: .zero)
            path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width+50 , y: 0))
            path.addLine(to: CGPoint(x: cell.offerLabel.bounds.width, y: 30))
                   path.addLine(to: CGPoint(x: 0, y: 30))
                   let shape = CAShapeLayer()
                   shape.path = path.cgPath
            cell.viewOfOffer.layer.mask = shape

        }
      
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectResturant = resturants[indexPath.row]
        performSegue(withIdentifier: "GoTo", sender: self)
    }
    
}
