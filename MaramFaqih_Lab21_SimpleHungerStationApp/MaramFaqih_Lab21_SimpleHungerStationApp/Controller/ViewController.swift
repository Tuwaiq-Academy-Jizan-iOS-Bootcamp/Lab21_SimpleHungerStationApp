//
//  ViewController.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//
import Foundation
import UIKit


class ViewController: UIViewController {
   // @IBOutlet weak var viewOffer: UIView!
    
    @IBOutlet weak var resturantsTableView: UITableView!
    @IBOutlet weak var headerImageView: UIImageView!
    var headers : [String] = []
    var resturantNameStruct : [DataSet] = []
    var resturantNameSelected : [DataSet] = []

    //var resturantNameStruct : Restaurant = [Any]

     var nameSelected = ""
     var deliveryTimeSelected = ""
     var ratingSelected = ""
    
     var cuisineSelected = ""
    var offerSelected : String? = nil
    var DeliveryPriceSelected = ""
    var minimumSelected = ""
    //var menuSelected : [Menu] = []
    var menuSelected : Int = Int()
    
    
    
//    var logoSelected : UIImage = UIImage()
//    var imageSelected : UIImage = UIImage()
//
    
    var logoSelected = ""
    var imageSelected = ""
   // resturantsTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        headerImageView.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
        headerImageView.layer.masksToBounds = true
        resturantsTableView.delegate = self
        resturantsTableView.dataSource = self
        headers = ["h1","h2","h3","h4"]

        getaData(with:"restaurants")
    }
    func getaData(with endPoint:String){
        
        let baseURL = "https://hungerstation-api.herokuapp.com/api/v1/\(endPoint)"
       if let url = URL(string: baseURL) {
        let session = URLSession(configuration: .default)
       
        let task = session.dataTask(with: url){ data, respons, error in
            if let error = error {
                print("error",error.localizedDescription)
            }else{
                if let safeData = data {
                    do{
                           let decoder = JSONDecoder()
                          
                           let decoderData = try decoder.decode(Restaurant.self, from: safeData)
                        DispatchQueue.main.async {
                            self.resturantNameStruct  = decoderData.data

                      //  self.resturantNameStruct  = decoderData
                       print("decoderData:",decoderData)
                        
//                               DispatchQueue.main.async {
//                                   self.users = decoderData
                                   self.resturantsTableView.reloadData()

//
   }


} catch{
    print("error f",error.localizedDescription)

               }
           }
       }
    }
           task.resume()
       }
}


    @IBAction func headerTapGestur(_ sender: UITapGestureRecognizer) {
      
    }
    
    @IBAction func headerSwipeGesturRight(_ sender: UISwipeGestureRecognizer) {
        if (index != 0){
            index -= 1
            }else{
                index = headers.count-1
            }
        headerImageView.image=UIImage(named: headers[index])
  
       
    }
    @IBAction func headerSwipeGesturLeft(_ sender: UISwipeGestureRecognizer) {
        if (index != headers.count-1){
            index += 1
            }else{
                index = 0
            }
        headerImageView.image=UIImage(named: headers[index])
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destintionToDetails = segue.destination as! ResturantView


            destintionToDetails.nameSelectedT =  nameSelected
            destintionToDetails.deliveryTimeSelectedT =  deliveryTimeSelected
            destintionToDetails.ratingSelectedT =  ratingSelected
            destintionToDetails.cuisineSelectedT =  cuisineSelected
            destintionToDetails.offerSelectedT =  offerSelected
            destintionToDetails.logoSelectedT =  logoSelected
            destintionToDetails.imageSelectedT =  imageSelected
            destintionToDetails.menuSelectedT =  menuSelected
            destintionToDetails.DeliveryPriceSelectedT = DeliveryPriceSelected
            destintionToDetails.minimumSelectedT = minimumSelected
            destintionToDetails.resturantNameSelectedT = resturantNameSelected

        }
    @IBAction func backToFrist(segue:UIStoryboardSegue){
        
    }
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return resturantNameStruct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! ResturntCell
//        cell.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
//
//        cell.layer.masksToBounds = true
        tableView.backgroundColor = .systemGray6
//            //viewForCell
//        cell.viewForCell.layer.cornerRadius = 8
//        cell.viewForCell.layer.shadowOffset = CGSize(width: 0, height: 3)
//        cell.viewForCell.layer.shadowRadius = 3
//        cell.viewForCell.layer.shadowOpacity = 0.3
//        cell.viewForCell.layer.shadowPath = UIBezierPath(roundedRect:   cell.viewForCell.bounds , byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
//        cell.viewForCell.layer.shouldRasterize = true
//        cell.viewForCell.layer.rasterizationScale = UIScreen.main.scale
//        cell.viewForCell.layer.cornerRadius = 8
//        cell.viewForCell.layer.shadowOffset = CGSize(width: 0, height: 3)
//        cell.viewForCell.layer.shadowRadius = 3
//        cell.viewForCell.layer.shadowOpacity = 0.1
//        cell.viewForCell.layer.masksToBounds = false
        cell.nameCell.text = resturantNameStruct[indexPath.row].name
        cell.deliveryTimeCell.text = String(resturantNameStruct[indexPath.row].delivery.time.min)+" - "+String(resturantNameStruct[indexPath.row].delivery.time.max)+" minutes"
        cell.ratingCell.text = String(resturantNameStruct[indexPath.row].rating)
        cell.cuisineCell.text = resturantNameStruct[indexPath.row].category
//        is_promoted.
//        isPromotedCell
        cell.isPromotedCell.layer.masksToBounds = true
        cell.isPromotedCell.layer.cornerRadius = 5
        
        if resturantNameStruct[indexPath.row].is_promoted {
            cell.isPromotedCell.text = " Promoted "
            
        }else{
            cell.isPromotedCell.isHidden = true
        }
        if let offer = resturantNameStruct[indexPath.row].offer{
            cell.offerCell.text = "\(offer.value) (Spend \(offer.spend))"
            
        }else{
            //cell.offerCell.isHidden = true
            cell.viewOffer.isHidden = true

        }
  
            let urlImage = URL(string:resturantNameStruct[indexPath.row].image)
            if let urlImage = urlImage {
              DispatchQueue.global().async {
                  //[weak self] in as! Decoderfrom
                  if let data = try? Data(contentsOf: urlImage){
                  DispatchQueue.main.async {

                    if tableView.cellForRow(at: indexPath) != nil {
                      cell.imageCell.image = UIImage(data: data)
                    }
                  }
                }
              }
            }
        let urlImageLogo = URL(string:resturantNameStruct[indexPath.row].resturant_image)
        if let urlImage = urlImageLogo {
          DispatchQueue.global().async {
              if let data = try? Data(contentsOf: urlImage){
              DispatchQueue.main.async {

                if tableView.cellForRow(at: indexPath) != nil {
                  cell.logoCell.image = UIImage(data: data)
               }
              }
            }
          }
        }
//        cell.imageCell.image = resturants[indexPath.row].image
//
//        cell.offerCell.text = resturantNameStruct[indexPath.row].offer
//
//
        cell.deliveryPriceCell.text = String(resturantNameStruct[indexPath.row].delivery.cost.value) + resturantNameStruct[indexPath.row].delivery.cost.currency
        //cell.currencyCell.text =
        
        //let widthLabel = cell.offerCell.sizeToFit()
        cell.cuisineCell.sizeToFit()
        cell.offerCell.sizeToFit()
        //Path part
        let path = UIBezierPath()
        path.move(to: .zero) //StartPoint frame.size
        path.addLine(to: CGPoint(x: cell.offerCell.bounds.size.width+25, y: 0))
        path.addLine(to: CGPoint(x: cell.offerCell.bounds.size.width+15, y: 27))
        path.addLine(to: CGPoint(x: 0, y: 27))
       
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        //cell.offerCell.sizeToFit()
        cell.viewOffer.layer.mask=shape
        //cell.viewOffer.sizeToFit()
        
        return cell
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100.0
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemGray6
        
        return view
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 10

        let maskLayer = CALayer()
        maskLayer.cornerRadius = 20
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 10 , dy: verticalPadding/2)
   
//        maskLayer.cornerRadius = 8
//        maskLayer.shadowOffset = CGSize(width: 0, height: 3)
//        maskLayer.shadowRadius = 3
//        maskLayer.shadowOpacity = 0.1
//        maskLayer.masksToBounds = false
        cell.layer.mask = maskLayer
      //  cell.UITableView.dropShadow()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrPath = resturantNameStruct[indexPath.row]
        nameSelected = arrPath.name
        deliveryTimeSelected = String(arrPath.delivery.time.min)+" - "+String(arrPath.delivery.time.max)+" minutes"

        ratingSelected = String(arrPath.rating)
        cuisineSelected = arrPath.category
        if let offer = resturantNameStruct[indexPath.row].offer{
            offerSelected = "\(offer.value) (Spend \(offer.spend))"
            
        }
        else
        {
            offerSelected = nil
        }
        imageSelected = arrPath.image
        logoSelected = arrPath.resturant_image
//        let urlImageLogo = URL(string:resturantNameStruct[indexPath.row].resturant_image)
//        if let urlImage = urlImageLogo {
//          DispatchQueue.global().async {
//
//              if let data = try? Data(contentsOf: urlImage){
//              DispatchQueue.main.async {
//
//                if tableView.cellForRow(at: indexPath) != nil {
//                    self.logoSelected = UIImage(data: data)!
//               }
//              }
//            }
//          }
//        }
//        let urlImage = URL(string:resturantNameStruct[indexPath.row].image)
//        if let urlImage = urlImage {
//          DispatchQueue.global().async {
//
//              if let data = try? Data(contentsOf: urlImage){
//              DispatchQueue.main.async {
//
//                if tableView.cellForRow(at: indexPath) != nil {
//                    self.imageSelected = UIImage(data: data)!
//               }
//              }
//            }
//          }
//        }
        //resturantNameSelected = [resturantNameStruct[indexPath.row]]
       menuSelected = arrPath.id
        DeliveryPriceSelected = String(arrPath.delivery.cost.value)+" "+arrPath.delivery.cost.currency
        minimumSelected = String(arrPath.delivery.cost.value)+" "+arrPath.delivery.cost.currency
        performSegue(withIdentifier: "toRestrunt", sender: indexPath)
    }

}
    

//extension UIView {
//    func dropShadow(scale: Bool = true) {
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.2
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 1
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//    }
//}
//class ShadowView: UIView {
//    override var bounds: CGRect {
//        didSet {
//            setupShadow()
//        }
//    }
//
//    private func setupShadow() {
//        self.layer.cornerRadius = 8
//        self.layer.shadowOffset = CGSize(width: 0, height: 3)
//        self.layer.shadowRadius = 3
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
//    }
//}

//class ShadowView: UIView {
//    override var bounds: CGRect {
//        didSet {
//            setupShadow()
//        }
//    }
//
//    private func setupShadow() {
//        self.layer.cornerRadius = 8
//        self.layer.shadowOffset = CGSize(width: 0, height: 3)
//        self.layer.shadowRadius = 3
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
//        self.layer.shouldRasterize = true
//        self.layer.rasterizationScale = UIScreen.main.scale
//    }
//}
