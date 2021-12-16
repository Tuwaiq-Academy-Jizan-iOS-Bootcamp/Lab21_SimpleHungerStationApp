//
//  ResturantView.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 11/04/1443 AH.
//

import UIKit

class ResturantView: UIViewController {
    
    @IBOutlet weak var menuTibleView: UITableView!
    
    
    @IBOutlet weak var resturantDeliveryTime: UILabel!
    
    @IBOutlet weak var viewInfoAboutResturantTwo: UIView!
    @IBOutlet weak var viewInfoAboutResturant: UIView!
    
    @IBOutlet weak var resturantOffer: UILabel!
    
    @IBOutlet weak var resturantMinimum: UILabel!
    @IBOutlet weak var resturantCuisine: UILabel!
    @IBOutlet weak var resturantRating: UILabel!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantLogo: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    
    @IBOutlet weak var resturantDeliveryPrice: UILabel!
    var resturantNameSelectedT : [DataSet] = []
    var nameSelectedT = ""
    var deliveryTimeSelectedT = ""
    var ratingSelectedT = ""
    var preSetOfState : CGFloat = 0
    var preSetOfStateImage : CGFloat = 0
    @IBOutlet weak var viewForOffer: UIView!
    var cuisineSelectedT = ""
    var offerSelectedT : String? = nil
    var DeliveryPriceSelectedT = ""
    var minimumSelectedT = ""
    var menuSelectedT :Int = Int()
    var logoSelectedT = ""
    var imageSelectedT = ""
    var menuResturant : [Menu] = []
    @IBOutlet weak var hidViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var setViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var hidImageConstraint: NSLayoutConstraint!
    var  preHeightView : CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preHeightView = viewInfoAboutResturantTwo.bounds.size.height

        viewInfoAboutResturantTwo.layer.cornerRadius = 8
        viewInfoAboutResturantTwo.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewInfoAboutResturantTwo.layer.shadowRadius = 3
        viewInfoAboutResturantTwo.layer.shadowOpacity = 0.1
        viewInfoAboutResturantTwo.layer.masksToBounds = false
     
        viewForOffer.layer.cornerRadius = 5
        viewInfoAboutResturant.layer.cornerRadius = 8
        
        viewInfoAboutResturant.layer.masksToBounds = true
        viewForOffer.layer.masksToBounds = true
        
        resturantName.text =  nameSelectedT
        resturantDeliveryTime.text =  deliveryTimeSelectedT
       resturantRating.text =  ratingSelectedT
       resturantCuisine.text =  cuisineSelectedT
        if let offer = offerSelectedT {
            resturantOffer.text = offer
            
        }
        else{
            resturantOffer.isHidden = true
            viewForOffer.isHidden = true
        }
        resturantDeliveryPrice.text =  DeliveryPriceSelectedT
        
        resturantLogo.image = nil
        resturantImage.image = nil

        let urlImageLogo = URL(string:logoSelectedT)
               if let urlImage = urlImageLogo {
                 DispatchQueue.global().async {
       
                     if let data = try? Data(contentsOf: urlImage){
                     DispatchQueue.main.async {
       
                         self.resturantLogo.image = UIImage(data: data)!
                      }
                     }
                   }
                 }
               
               let urlImage = URL(string: imageSelectedT)
               if let urlImage = urlImage {
                 DispatchQueue.global().async {
       
                     if let data = try? Data(contentsOf: urlImage){
                     DispatchQueue.main.async {
                         self.resturantImage.image = UIImage(data: data)!
                      }
                     }
                   }
                 }
               
        
        resturantMinimum.text = minimumSelectedT
        menuTibleView.delegate =  self
        menuTibleView.dataSource = self
        getaData(with: String(menuSelectedT))

resturantDeliveryTime.sizeToFit()
      
    }

    func getaData(with endPoint:String){
        
        let baseURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants/\(endPoint)"
       if let url = URL(string: baseURL) {
        let session = URLSession(configuration: .default)
       
        let task = session.dataTask(with: url){ data, respons, error in
            if let error = error {
                print("error",error.localizedDescription)
            }else{
                if let safeData = data {
                    do{
                           let decoder = JSONDecoder()
                          
                           let decoderData = try decoder.decode(MenuResturant.self, from: safeData)
                        self.menuResturant  = decoderData.menu
                        DispatchQueue.main.async {
                      
                       print("decoderData:",decoderData)
                        

                                   self.menuTibleView.reloadData()


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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ResturantView: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuResturant.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toCellMenu", for: indexPath ) as! MenuCell
        cell.mealNameCell.text = menuResturant[indexPath.row].title
        cell.priceMealCell.text = String( menuResturant[indexPath.row].price.value)+" "+menuResturant[indexPath.row].price.currency
        if let calories = menuResturant[indexPath.row].calories {
        cell.calories.text = String(calories)
        }else{
            cell.calories.isHidden = true
            cell.caloriesImage.isHidden = true
        }

        if let subTitle = menuResturant[indexPath.row].subtitle {
            cell.subTitle.text = subTitle
            
        }
        else{
            cell.subTitle.isHidden = true
        }
        
        let urlImage = URL(string:menuResturant[indexPath.row].image)
        if let urlImage = urlImage {
          DispatchQueue.global().async {
             
              if let data = try? Data(contentsOf: urlImage){
              DispatchQueue.main.async {

                if tableView.cellForRow(at: indexPath) != nil {
                    cell.imageMenuCell.image = UIImage(data: data)!
               }
              }
            }
          }
        }
       return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      //up
        if   scrollView.contentOffset.y>0 {
            
            if viewInfoAboutResturantTwo.bounds.size.height > viewInfoAboutResturant.bounds.size.height * 1.1{
                //view
               let ofStet = preSetOfState - scrollView.contentOffset.y
               let  constHeight = hidViewConstraint.constant + ofStet
               hidViewConstraint.constant = constHeight
               //image
               let ofStetImage = preSetOfStateImage - scrollView.contentOffset.y
               let constHeightImage = hidImageConstraint.constant + ofStetImage
               hidImageConstraint.constant = constHeightImage
                
            }
        }
        
    //down
        else {
            //view
            if viewInfoAboutResturantTwo.bounds.size.height <= preHeightView {
                
            let ofStet = preSetOfState - scrollView.contentOffset.y
            let  constHeight = hidViewConstraint.constant + ofStet
            hidViewConstraint.constant = constHeight
            //image
            let ofStetImage = preSetOfStateImage - scrollView.contentOffset.y
            let constHeightImage = hidImageConstraint.constant + ofStetImage
            hidImageConstraint.constant = constHeightImage
            }
        }
       }
    }
    
     


