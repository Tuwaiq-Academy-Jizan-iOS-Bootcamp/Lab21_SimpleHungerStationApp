import UIKit

class ResturantViewController: UIViewController {
    @IBOutlet weak var restorantsTabelView: UITableView!
    var restorants: Resturant = Resturant(data: [])
    var idSender = 0
    var restorantBackImageSender = ""
    var logoSener = ""
    var nameSender = ""
    var raitingSender:Float = 0
    var contantSender = ""
    var minimumCostSender:Double = 0
    var deliveryCostSender:Double = 0
    var deliveryMinTimeSender = 0
    var deliveryMaxTimeSender = 0
    var promotedLabelSender = ""
    let restorantsURL = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadRestorantData(restorantsURL)
        restorantsTabelView.delegate = self
        restorantsTabelView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toMenu = segue.destination as? MenuViewController
        toMenu?.idResiver = idSender
        toMenu?.backImageResiver = restorantBackImageSender
        toMenu?.logoResiver = logoSener
        toMenu?.nameResiver = nameSender
        toMenu?.raitingResiver = raitingSender
        toMenu?.minimumCostResiver = minimumCostSender
        toMenu?.deliveryCostResiver = deliveryCostSender
        toMenu?.deliveryMinTimeResiver = deliveryMinTimeSender
        toMenu?.deliveryMaxTimeResiver = deliveryMaxTimeSender
        toMenu?.promotedLabelResiver = promotedLabelSender
        toMenu?.contantResiver = contantSender
    }
    @IBAction func getBack(segue:UIStoryboardSegue) {
    }
    func downloadRestorantData(_ FromURL: String) {
        if let urlData = URL(string: FromURL) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: urlData) { data, response, error in
                if let error = error {
                    print("The URL Is Not Working", error.localizedDescription)
                }else {
                    if let restorantData = data {
                        do {
                            let decorder = JSONDecoder()
                            self.restorants = try decorder.decode(Resturant.self, from: restorantData)
                            DispatchQueue.main.async {
                                self.restorantsTabelView.reloadData()
                            }
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
