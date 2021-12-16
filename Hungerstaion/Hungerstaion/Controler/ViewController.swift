import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var hederViewController: UIImageView!
    @IBOutlet weak var tabelView: UITableView!{
        
        didSet{
            tabelView.delegate = self
            tabelView.dataSource = self
        }
    }
    var resturantArr:[DataR] = []
    
    var selectMenue:DataR?

    override func viewDidLoad() {
        super.viewDidLoad()
        restrunt()
       
    }
@IBAction func rootViewController(segue: UIStoryboardSegue){
            print("ssss")
        }
    var swipeArr = ["image1","image2","image3","image4","image5"]
   
     var index = 0
        
@IBAction func swapRight(_ sender: Any) {
        index += 1
    if index > 4 {
        index = 0
    }
        hederViewController.image = UIImage(named: swipeArr[index])
    }
@IBAction func swapLeft(_ sender: Any) {
        
        
        index -= 1
       if index < 0 {
           index = 4
       }
       hederViewController.image = UIImage(named: swipeArr[index])
    }
    func restrunt() {
    let urlRestrent = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
if let urlResponse = URL(string: urlRestrent){
let urlSesstion = URLSession(configuration: .default)
let urlTask = urlSesstion.dataTask(with: urlResponse) { data, response, error in
            if let error = error {
                print("Error", error.localizedDescription)
            }else{
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do{
                        let foodData = try decoder.decode(Restaurant.self, from: safeData)
                        self.resturantArr = foodData.data
                        print(self.resturantArr)
                        DispatchQueue.main.async {
                            self.tabelView.reloadData()
                        }
                    
                    } catch{
                        print("jjjjj",error.localizedDescription)
                    }
                }
            }
}
            urlTask.resume()
            
            
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  let GoTo  = segue.destination as! ViewControllerTwo

        GoTo.selectMenue = selectMenue
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturantArr.count
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMenue = resturantArr[indexPath.row]
        performSegue(withIdentifier: "goTow", sender: self)
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath) as! DetailsTableViewCell
        DispatchQueue.main.async {
            cell.resturantLogo.loadImageUsingCache(with: self.resturantArr[indexPath.row].resturant_image)
            cell.resturantImage.loadImageUsingCache(with: self.resturantArr[indexPath.row].image)
            cell.resturantName.text = self.resturantArr[indexPath.row].name
            if let offer = self.resturantArr[indexPath.row].offer {
           
                cell.resturantOfferLabel.text = offer.value + "\(offer.spend)"
                   let path = UIBezierPath()
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: cell.resturantOfferLabel.bounds.width+45 , y: 0))
                    path.addLine(to: CGPoint(x: cell.resturantOfferLabel.bounds.width, y: 30))
                    path.addLine(to: CGPoint(x: 0, y: 30))
                    let frame = CAShapeLayer()
                    frame.path = path.cgPath
                    cell.resturantofferView.layer.mask = frame
                
                
            }else{
            cell.resturantOfferLabel.isHidden = true
            cell.resturantofferView.isHidden = true
            }
            cell.resturantTypeFood.text = self.resturantArr[indexPath.row].category
            cell.resturantTimeFood.text = "\(self.resturantArr[indexPath.row].delivery.time.min) - \(self.resturantArr[indexPath.row].delivery.time.max) menutes | \(self.resturantArr[indexPath.row].delivery.cost.value) \(self.resturantArr[indexPath.row].delivery.cost.currency) "
            cell.resturantPriceDelivery.text = "Live traking"
            cell.resturantStar.text = "\(self.resturantArr[indexPath.row].rating)"
            
            if self.resturantArr[indexPath.row].is_promoted == false{
                cell.promoted.isHidden = true
                
            }
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    }
