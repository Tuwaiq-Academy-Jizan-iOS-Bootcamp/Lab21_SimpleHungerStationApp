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
    
    @IBOutlet weak var viewInfoAboutResturant: UIView!
    
    @IBOutlet weak var resturantOffer: UILabel!
    
    @IBOutlet weak var resturantMinimum: UILabel!
    @IBOutlet weak var resturantCuisine: UILabel!
    @IBOutlet weak var resturantRating: UILabel!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var resturantLogo: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    
    @IBOutlet weak var resturantDeliveryPrice: UILabel!
    
    var nameSelectedT = ""
    var deliveryTimeSelectedT = ""
    var ratingSelectedT = ""
   
    var cuisineSelectedT = ""
    var offerSelectedT = ""
    var DeliveryPriceSelectedT = ""
    var minimumSelectedT = ""
    var menuSelectedT :Int = Int()
    var logoSelectedT:UIImage = UIImage()
    var imageSelectedT:UIImage = UIImage()
    var menuResturant : [Menu] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInfoAboutResturant.layer.cornerRadius = 0.1 *  viewInfoAboutResturant.bounds.size.height

        viewInfoAboutResturant.layer.masksToBounds = true

        // Do any additional setup after loading the view.
        
        resturantName.text =  nameSelectedT
        resturantDeliveryTime.text =  deliveryTimeSelectedT
       resturantRating.text =  ratingSelectedT
       resturantCuisine.text =  cuisineSelectedT
       resturantOffer.text =  offerSelectedT
        resturantDeliveryPrice.text =  DeliveryPriceSelectedT
         resturantLogo.image =  logoSelectedT
        resturantImage.image =  imageSelectedT
        resturantMinimum.text = minimumSelectedT
        //print(menuSelectedT)
        menuTibleView.delegate =  self
        menuTibleView.dataSource = self
        getaData(with: String(menuSelectedT))
      
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
                      
                      //  self.resturantNameStruct  = decoderData
                       print("decoderData:",decoderData)
                        
//                               DispatchQueue.main.async {
//                                   self.users = decoderData
                                   self.menuTibleView.reloadData()

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
        //cell.imageMenuCell.image = menuResturant[indexPath.row].mealImage
       return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
     
    
}
