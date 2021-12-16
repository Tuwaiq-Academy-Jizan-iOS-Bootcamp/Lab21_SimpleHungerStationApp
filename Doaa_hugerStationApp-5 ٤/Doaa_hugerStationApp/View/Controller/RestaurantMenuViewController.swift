//
//  RestaurantMenuViewController.swift
//  Doaa_hugerStationApp
//
//  Created by Dua'a ageel on 11/04/1443 AH.



import UIKit

class RestaurantMenuViewController: UIViewController {
    var idRestaurant:Int?
    var menuItemes:[Menu]=[]
    var imgee:String?
    var resImg:String?
    var name:String?
    var category:String?
    var rating:Double?
    var max:Int?
    var min:Int?
    var deliverycost:Double?
    var currency:String?
    var spend:Int?
    var selectedRestaurantItemes:[RestaurantOB]=[]
    
    @IBOutlet weak var maxlbl: UILabel!
    @IBOutlet weak var minlbl: UILabel!
    @IBOutlet weak var deliverycostlbl: UILabel!
    @IBOutlet weak var currencylbl: UILabel!
    @IBOutlet weak var valuelbl: UILabel!
    @IBOutlet weak var ratinglbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var categorylbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var resturantImg: UIImageView!
    @IBOutlet weak var TableMenu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
                self.navigationController?.navigationBar.setNavClear()
        self.navigationItem.hideBackWord()
       
        TableMenu.register(UINib.init(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        idRestaurant = selectedRestaurantItemes[0].id
        MenuData(FromURL: APIConstant.restaurant+"/\(idRestaurant ?? 1)")
        let urlImage = URL(string:self.selectedRestaurantItemes[0].image ?? "")
                 if let urlImage = urlImage {
                   DispatchQueue.global().async {
                      
                       if let data = try? Data(contentsOf: urlImage){
                       DispatchQueue.main.async {

                   
                           self.img.image = UIImage(data: data)!
                        
                       }
                     }
                   }
                 }
        let urlImage2 = URL(string:self.selectedRestaurantItemes[0].resturantImage ?? "")
                       if let urlImage = urlImage {
                         DispatchQueue.global().async {
                            
                             if let data = try? Data(contentsOf: urlImage){
                             DispatchQueue.main.async {

                         
                                 self.resturantImg.image = UIImage(data: data)!
                              
                             }
                           }
                         }
                       }
        self.namelbl.text = self.selectedRestaurantItemes[0].name
        self.categorylbl.text = self.selectedRestaurantItemes[0].category
        self.maxlbl.text = String(self.selectedRestaurantItemes[0].delivery?.time?.max ?? 1)
        self.minlbl.text = String(self.selectedRestaurantItemes[0].delivery?.time?.min ?? 1)
        self.deliverycostlbl.text = String(self.selectedRestaurantItemes[0].delivery?.cost?.value ?? 0.0)
        self.currencylbl.text = self.selectedRestaurantItemes[0].delivery?.cost?.currency
        self.valuelbl.text = String(self.selectedRestaurantItemes[0].offer?.spend ?? 1)
        self.ratinglbl.text = String(self.selectedRestaurantItemes[0].rating ?? 0.0)
        // Do any additional setup after loading the view.
        
        TableMenu.delegate = self
        TableMenu.dataSource = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {

                 self.navigationController?.navigationBar.setNavClear()
        self.navigationItem.hideBackWord()

             }

             override func viewWillDisappear(_ animated: Bool) {
                 self.navigationController?.navigationBar.setNavClear()
                self.navigationItem.hideBackWord()

             
             }
    
    
    @IBAction func xx(_ sender: Any) {
        
       for controller in self.navigationController!.viewControllers as Array {
           if controller.isKind(of: ViewController.self) {
              self.navigationController!.popToViewController(controller, animated: true)
              break
          }
       }

   }
    
    func MenuData(FromURL: String) {
        if let restorantData = URL(string: FromURL) {
            print("kjiu98\(restorantData)")
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: restorantData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let jsonRestorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            let restorantsInfo = try decorder.decode(MenuOB.self, from: jsonRestorantData)
                            self.menuItemes = restorantsInfo.menu!
                     print("restorantsInfo\(restorantsInfo)")
                         DispatchQueue.main.async {
                             self.TableMenu.reloadData()
                         }
                        
                            print(restorantsInfo)
                        }catch {
                            print("Somthing Wrongs In the JSON Struct", error.localizedDescription)
                        }
                    }
                }
            }
            urlTask.resume()
        }
    }
    

}
extension RestaurantMenuViewController : UITableViewDelegate , UITableViewDataSource {
  
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
           return self.menuItemes.count
       
       
       }
      
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = TableMenu.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell

    let item = menuItemes[indexPath.row]
    
    let urlImage = URL(string:menuItemes[indexPath.row].image ?? "")
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
    

    cell.pricelbl.text = String(item.price?.value ?? 1 )
    cell.currencylbl.text = item.price?.currency
    cell.tietle.text = item.title
       
      return cell
    }
                
           
  
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    return 118
   }
   
   
   
    
}
