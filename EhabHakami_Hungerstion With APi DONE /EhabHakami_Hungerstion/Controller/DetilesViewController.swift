//
//  DetilesViewController.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 11/04/1443 AH.
//

import UIKit

class DetilesViewController: UIViewController {
    
    
    @IBOutlet weak var stackDiscountLabel: UIStackView!
    
    var menu:[MenusData] = []
    @IBOutlet weak var restrantImageInView: UIImageView!
    var restrantImageInView1 = UIImage(named: "")
    @IBOutlet weak var nameRestrantLabelInView: UILabel!
    var nameRestrantLabelInView1 = ""
    
    @IBOutlet weak var rateFoodLabelInView: UILabel!
    var rateFoodLabelInView1:Double = 0.0
    @IBOutlet weak var typeOfFoodLabelInView: UILabel!
    var typeOfFoodLabelInView1 = ""
    @IBOutlet weak var priceOfFoodLabelInView: UILabel!
    var priceOfFoodLabelInView1 = ""
    @IBOutlet weak var priceDeliveryLabelInView: UILabel!
    var priceDeliveryLabelInView1 = ""
    @IBOutlet weak var DeliveryTimeLabelInView: UILabel!
    var DeliveryTimeLabelInView1 = ""
    
    @IBOutlet weak var detilesMyTableView: UITableView!
    var tableViewDitels = UITableView()
    
    @IBOutlet weak var detilesFoodImageView: UIImageView!
    var imageOfView1 = UIImage(named: "")
    
    @IBOutlet weak var discountInformationLabel: UILabel!
    var discountInformationLabel2 = ""
    
    
    @IBOutlet weak var informationRestrantView: UIView!
    
    @IBOutlet weak var tagimage: UIImageView!
    
    @IBOutlet weak var heightOfView: NSLayoutConstraint!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerSize: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        detilesMyTableView.delegate = self
        detilesMyTableView.dataSource = self
        
        detilesFoodImageView.image = imageOfView1
        restrantImageInView.image = restrantImageInView1
        nameRestrantLabelInView.text = nameRestrantLabelInView1
        rateFoodLabelInView.text = "\(Double(rateFoodLabelInView1))"
        typeOfFoodLabelInView.text = typeOfFoodLabelInView1
        priceOfFoodLabelInView.text = "15SR"
        priceDeliveryLabelInView.text = priceDeliveryLabelInView1
        DeliveryTimeLabelInView.text = DeliveryTimeLabelInView1
        discountInformationLabel.text = discountInformationLabel2
        
        if discountInformationLabel.text == "no"{
            discountInformationLabel.removeFromSuperview()
            tagimage.removeFromSuperview()
            stackDiscountLabel.removeFromSuperview()
            
        }
        
        //shado view sating
        
        
        switch nameRestrantLabelInView1 {
        case "Burger Land":
            getData(with: "/restaurants/1")
        case "Molten Chocolate":
            getData(with: "/restaurants/2")
        case "Applebee's":
            getData(with: "/restaurants/3")
        case "Al Bake":
            getData(with: "/restaurants/4")
        case "Dunkin Donuts":
            getData(with: "/restaurants/5")
        case "Herfy":
            getData(with: "/restaurants/6")
        default:
            print("Eroor")
        }
        
        
        informationRestrantView.layer.masksToBounds = true
        informationRestrantView.layer.cornerRadius = 7
        
        stackDiscountLabel.layer.masksToBounds = true
        stackDiscountLabel.layer.cornerRadius = 7
        
        
        informationRestrantView.layer.shadowPath = UIBezierPath(rect: informationRestrantView.bounds).cgPath
        
        informationRestrantView.layer.shouldRasterize = true
        
        informationRestrantView.layer.rasterizationScale = UIScreen.main.scale
        
    }
    
    func getData(with endPoint:String){
        print("Is this called??")
        let baseURL = "https://hungerstation-api.herokuapp.com/api/v1"
        // 1. create url
        if let url = URL(string: baseURL + endPoint) {
            print("WAS THE URL IN CORRECT FORMAT")
            //2. create a URL Session--------------  (السيشن دايما ثابت في اي -> Api)
            let session = URLSession(configuration: .default)
            //3 create a task ----------------   (و التاسك ثابت في اي  -> Api)
            // task divenatin send data requset and response
            let task = session.dataTask(with: url) { data, response, error in
                /// decoder من هنا
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    
                    
                    if let safeData = data {
                        
                        // print(String(data: safeData, encoding: .utf8))
                        
                        /// ths error handling
                        
                        do {
                            
                            // JSONDecoder() ths is func assast تساعد على ربط السويفت و الجيسون
                            let decoder = JSONDecoder()
                            
                            // decode nedd stracrt.self or [stract].self
                            
                            // ui alwas uptate  min thred solf prbleam error coler Purple الايرور البنفسجي
                            
                            let decodedData = try decoder.decode(Menus.self, from: safeData)
                            
                            print("DECODED DATA",decodedData.menu[1].id)
                            
                            
                            
                            // aa change value decodedData cuse used out scop and add value in exstantion table view
                            self.menu = decodedData.menu
                            
                            // func show in data in min
                            DispatchQueue.main.async {
                                
                                // conected with table view
                                self.detilesMyTableView.reloadData()
                                
                            }
                            
                            
                            // a عشان اتاكد من المعلومات انها موجودة وكلو تمام
                            for ele in decodedData.menu {
                                print(ele.image)
                                //                            print(ele.level)
                                //                            print(ele.img)
                            }
                            
                        } catch {
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        } //end error handling
                        
                    } //
                    
                    
                } //end else error handling
                
                
            }  // end task
            
            
            //4. start/resume the task
            task.resume()
            
            
        } // end url if
        
        
    } // end func getData
    
    
    
    
}

extension DetilesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellTwo = tableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath) as! MyCustomViewCell
        
        
        
        cellTwo.costLabel.text = "\(menu[indexPath.row].price.value) SR"
        cellTwo.discrabtionMilLabel.text = menu[indexPath.row].subtitle
        cellTwo.nameMaleLabel.text = menu[indexPath.row].title
        
        if menu[indexPath.row].calories != nil {
            let cal = menu[indexPath.row].calories
            
            cellTwo.valueCaluresLabel.text = "\(cal!)"
        } else {
            cellTwo.valueCaluresLabel.removeFromSuperview()
            cellTwo.colaresImage.removeFromSuperview()
        }
        
        if let hungerStationImagemnueURl = URL(string: self.menu[indexPath.row].image)
        {
            
            DispatchQueue.global().async {
                if let hungerStationImageData = try? Data(contentsOf: hungerStationImagemnueURl) {
                    let hangerImage = UIImage(data: hungerStationImageData)
                    
                    DispatchQueue.main.async {
                        cellTwo.muneImageView.image = hangerImage
                        
                        
                        
                    }
                }
            }
            
        }
        
        
        
        return cellTwo
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newHeight = scrollView.contentOffset.y
        // View Size
        if heightOfView.constant > 324 {
            heightOfView.constant = 324
        }else if heightOfView.constant < 230 {
            heightOfView.constant = 230
        }
        // Header Height
        if headerHeight.constant > 135 {
            headerHeight.constant = 135
        }else if headerHeight.constant < 80 {
            headerHeight.constant = 80
        }
        // Header Size
        if headerSize.constant > 120 {
            headerSize.constant = 120
        }else if headerSize.constant < 75 {
            headerSize.constant = 75
        }
        // Oborations
        heightOfView.constant -= newHeight
        headerHeight.constant -= newHeight
        headerSize.constant -= newHeight / 2
    }
    
    
}
