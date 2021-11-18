
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var selseImageViwe: UIImageView!
    
    
    @IBOutlet weak var hungerStaionTableView: UITableView!{
    didSet {
        
        hungerStaionTableView.delegate = self
        hungerStaionTableView.dataSource = self
    }
    
    }
var herfy = Restrent(name: "Herfy", typefood: "Fast Food", timeDilevary: "40 - 50 mintes", track: "live Traking", star: "3,8 ",logo: "images-1" ,image: "images")
var  ocaenBasket = Restrent(name: "OcaenBasket", typefood: "sea Food", timeDilevary: "45 - 50 mintes", track: "live Traking", star: "3,9" ,logo: "images2" ,image: "images3")
var applebees = Restrent(name: "Applebees", typefood: "Grills Amarican Food", timeDilevary: "45 - 55 mintes", track: "live Traking", star: "3,8" ,logo: "images5",image: "images4")
    
    var selectMenue:Restrent?

    
    
    var arreyRestrent: [Restrent] = []
    
    
    
var swipeArr = ["img1","img2","img3","img4","img5","img6"]
    
 var index = 0
    
    
    
    
    @IBAction func swipeGester(_ sender: Any) {
            index += 1
        if index > 5 {
            index = 0
        }
        selseImageViwe.image = UIImage(named: swipeArr[index])
    }
   
    
    @IBAction func swipeLift(_ sender: Any) {
         index -= 1
        if index < 0 {
            index = 5
        }
        selseImageViwe.image = UIImage(named: swipeArr[index])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arreyRestrent.append(herfy)
        arreyRestrent.append(ocaenBasket)
        arreyRestrent.append(applebees)
    
}
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  let GoTo  = segue.destination as! DetilsViweController

        GoTo.selectMenue = selectMenue
    }

    }
 
extension  ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arreyRestrent.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMenue = arreyRestrent[indexPath.row]
        performSegue(withIdentifier: "GoTo", sender: self)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetileTableViweCell
        cell.restaurantLogo.image = UIImage(named: arreyRestrent[indexPath.row].logo)
        cell.restaurantName.text = arreyRestrent[indexPath.row].name
        cell.restaurantImageView.image = UIImage(named: arreyRestrent[indexPath.row].image)

        cell.restaurantType.text = arreyRestrent[indexPath.row].typefood
        cell.restaurantDeliveryTime.text = arreyRestrent[indexPath.row].timeDilevary
        cell.delivery.text = arreyRestrent[indexPath.row].track
        cell.starPoint.text = arreyRestrent[indexPath.row].star
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .systemYellow

//        let image = UIImageView()
//        image.image = UIImage(named: "images6")
//        self.view.addSubview(view)
//        view.addSubview(image)

        return view
        
    }
    
    
    
}

