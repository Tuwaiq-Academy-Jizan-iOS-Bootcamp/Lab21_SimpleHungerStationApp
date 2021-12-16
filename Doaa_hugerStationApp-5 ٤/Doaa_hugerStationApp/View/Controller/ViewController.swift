//
//  ViewController.swift
//  Doaa_hugerStationApp
//
//  Created by Dua'a ageel on 11/04/1443 AH.



import UIKit


class ViewController: UIViewController {
    var restaurantItemes:[RestaurantOB]=[]
    var indexx = 0
    var selectRestaurantItemes:[RestaurantOB]=[]
    
    var imgcollection=["cell1".image_,"cell2".image_,"cell3".image_,"cell1".image_,"cell4".image_]
    @IBOutlet weak var collection: UICollectionView!
    
    @IBOutlet weak var RestaurantTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.setNavClear()
//        print("jjjkhuj\(self.navigationController)")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
collection.register(UINib.init(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
        
         RestaurantTable.register(UINib.init(nibName: "RestaurantTableViewCell", bundle: nil), forCellReuseIdentifier: "RestaurantTableViewCell")
        
       RestorantData(FromURL: APIConstant.restaurant)
    
        RestaurantTable.delegate = self
        RestaurantTable.dataSource = self
           
    }
//
    override func viewDidAppear(_ animated: Bool) {

              self.navigationController?.navigationBar.setNavClear()
              self.navigationItem.hideBackWord()
          }

          override func viewWillDisappear(_ animated: Bool) {
              self.navigationController?.navigationBar.setNavClear()
              self.navigationItem.hideBackWord()


         }
    func RestorantData(FromURL: String) {
        if let restorantData = URL(string: FromURL) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let jsonRestorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let restorantsInfo = try decorder.decode(Restorants.self, from: jsonRestorantData)
                         self.restaurantItemes = restorantsInfo.data
                         DispatchQueue.main.async {
                             self.RestaurantTable.reloadData()
                         }
                        
                            print(restorantsInfo)
                        }catch {
                            print("Somthing Wrongs ", error.localizedDescription)
                        }
                    }
                }
            }
            urlTask.resume()
        }
    }
   
           

}
extension ViewController : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //  return KeywordsName.count
 
        return imgcollection.count
         }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
          let cell = collection.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
         let item = imgcollection[indexPath.row]
     
        cell.img.image = item
            return cell}
        
      
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

          
       }
    
      
    
}
extension ViewController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
                 let height : CGFloat = 108
         
             let width :CGFloat = 86

                       return CGSize(width: width , height: height)
        
     }
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
           return self.restaurantItemes.count
       
       
       }
      
    
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = RestaurantTable.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell

    let item = restaurantItemes[indexPath.row]
    cell.categorylbl.text = item.category
    cell.namelbl.text = item.name
    let urlImage = URL(string:restaurantItemes[indexPath.row].image ?? "")
             if let urlImage = urlImage {
               DispatchQueue.global().async {
                  
                   if let data = try? Data(contentsOf: urlImage){
                   DispatchQueue.main.async {

                     if tableView.cellForRow(at: indexPath) != nil {
                       cell.imge.image = UIImage(data: data)!
                    }
                   }
                 }
               }
             }
    let urlImage2 = URL(string:restaurantItemes[indexPath.row].resturantImage ?? "")
             if let urlImage = urlImage {
               DispatchQueue.global().async {
                  
                   if let data = try? Data(contentsOf: urlImage){
                   DispatchQueue.main.async {

                     if tableView.cellForRow(at: indexPath) != nil {
                       cell.imgresturant.image = UIImage(data: data)!
                    }
                   }
                 }
               }
             }
  
    cell.maxlbl.text = String(item.delivery?.time?.max ?? 1)
    cell.minlbl.text = String(item.delivery?.time?.min ?? 1)
    cell.costlbl.text = String(item.delivery?.cost?.value ?? 1 )
    cell.currencylbl.text = item.delivery?.cost?.currency
    cell.lblrating.text = String(item.rating ?? 0.0)
    if(item.isPromoted == false){
        cell.viewPrometed.isHidden = true
    }
    if(item.offer == nil){
        cell.viewOffer.isHidden = true
        
    }else{
           cell.viewOffer.isHidden = false
        cell.valuelbl.text = item.offer?.value
        cell.spendlbl.text = String(item.offer?.spend ?? 1)
    }
                      return cell
           
       
       
   }
  
    
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       selectRestaurantItemes = [restaurantItemes[indexPath.row]]

    self.performSegue(withIdentifier: "RestaurantMenuId", sender: self)
    
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RestaurantMenuId" {
            let vc = segue.destination as! RestaurantMenuViewController
            vc.selectedRestaurantItemes = selectRestaurantItemes
        }
          
        
    
    }
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    return 350.0
   }
   
   
   
    
}
extension UIViewController {

    func showToast(message: String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-200, width: 200, height: 50))
        toastLabel.numberOfLines = 0
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.4, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


class UINavigationBarApperance {
    
    
    static func removeBottomLineUnderNavigationBar(view: UIViewController!) {
        view.navigationController?.navigationBar.shadowImage = UIImage()
        view.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    static func setShadowUnderNavigationBar(view: UIViewController!) {
//        view.navigationController?.navigationBar.layer.shadowColor = UIColor.hexColor(hex: "#CECECE").withAlphaComponent(0.3).cgColor
        view.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.navigationController?.navigationBar.layer.shadowRadius = 4.0
        view.navigationController?.navigationBar.layer.shadowOpacity = 1.0
        view.navigationController?.navigationBar.layer.masksToBounds = false
        
    }
    
}

// الخلية تصير دائرية
extension UIView {
  

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

 

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {

            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable
    var shadowOffset : CGSize{

        get{
            return layer.shadowOffset
        }set{

            layer.shadowOffset = newValue
        }
    }
// شدو للفيو
    @IBInspectable
    var shadowColor : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity : Float {

        get{
            return layer.shadowOpacity
        }
        set {

            layer.shadowOpacity = newValue

        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    
   
    
}

extension UIColor {
    class  func hexColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UINavigationItem {
    
    func hideBackWord()  {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.backBarButtonItem = backItem
    }
    
}

extension UINavigationBar {
    
    func setNavClear() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        
        
    }
    func setNavwhite() {
        self.backgroundColor = .white
        
           
       }
    func setNavUNClear() {

        
        let backBarBtnItem = UIBarButtonItem()
      
        
        //backBarBtnItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Cairo-Regular", size: 12)!], for: UIControl.State.normal)
   
        
        self.layoutIfNeeded()
        
    }
  
    
}

extension String {
    // للتحويل من سترنغ ل صورة

    var image_ : UIImage? {
        return UIImage.init(named: self)
    }
 
}

@IBDesignable extension UIButton {


    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true  // add this to maintain corner radius
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
