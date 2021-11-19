//
//  ViewController.swift
//  DahmaJaber_MiniHungerStition
//
//  Created by dahma alwani on 14/04/1443 AH.
//

import UIKit

struct TheResturant {
    var title:String
    var subtitle:String
    var timer:String
    var watcher:String
    var star:String
    var imageLarge:String
    var imageSmall:String
}

struct Minue {
    var meal:String
    var price:String
    var imageMeal:String
}

class ViewController: UIViewController {

//    var resturantName:TheResturant?
//    var theResturants :TheResturant?
//    var theResturants : [[TheResturant]] = []
//    var theResturants : TheResturant?
    
    var minues: [Minue] = []
    var herfy : [Minue] = [
        Minue(meal: "combo Super Herfy Large Size", price: "32", imageMeal: "herfy1"),
        Minue(meal: "combo Chickin Tortilla Large Size", price: "27", imageMeal: "herfy2"),
        Minue(meal: "combo Herfy Wrap Spicy Large Size", price: "31", imageMeal: "herfy3"),
        Minue(meal: "combo Dynamite Chicken Fillet Medium Size", price: "31", imageMeal: "herfy4"),
        Minue(meal: "Double Super Herfy", price: "26", imageMeal: "herfy4")
    ]
    var kudo :[Minue] = [
    Minue(meal: "supreme Trio Combo Hd", price: "26", imageMeal: "kudo1"),
    Minue(meal: "Sweet Chili Chicken sandwich", price: "34", imageMeal: "kudo2"),
    Minue(meal: "Kudo Chicken Combo", price: "29", imageMeal: "kudo3"),
    Minue(meal: "club Combo", price: "31", imageMeal: "kudo4"),
    Minue(meal: "Veggie Combo", price: "19", imageMeal: "kudo5")
    
    ]
    var burgerKing : [Minue] = [
        Minue(meal: "Fiery Ckn Fillet Meal", price: "27", imageMeal: "king1"),
        Minue(meal: "Whopper Meal", price: "34", imageMeal: "king2"),
        Minue(meal: "Big King XL Meal", price: "25", imageMeal: "king3"),
        Minue(meal: "Chicken Steakhouse Meal", price: "34", imageMeal: "king4")
       
    ]
    var theResturants :[TheResturant] = [ TheResturant(title: "herfy", subtitle: "fast food" , timer: "Live Tracking" , watcher: "40 - 50 min" , star: "3.8", imageLarge: "herfy", imageSmall: "herfyLogo"),
        TheResturant(title: "kudo", subtitle: "fast food", timer: "Live Tracking", watcher: "30 - 50 min", star: "4", imageLarge: "kudo", imageSmall: "kudoLogo"),
     TheResturant(title: "burgerKing", subtitle: "fast food", timer: "Live Traking", watcher: "50 min", star: "4.5", imageLarge: "burgerKing", imageSmall: "burgerKingLogo")]
        
    @IBOutlet weak var itemsTableView: UITableView!
//    var minues : [Minue] = []
   
    override func viewDidLoad() {
    super.viewDidLoad()
            itemsTableView.dataSource = self
            itemsTableView.delegate = self
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let theDetailVC = segue.destination as! DetaileViewController
         theDetailVC.title = title
         }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return theResturants.count
         }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellView
        
    cell.titleLable.text = theResturants[indexPath.row].title
    cell.subtitleLable.text = theResturants[indexPath.row].subtitle
    cell.timerLable.text = theResturants[indexPath.row].timer
    cell.watcherLable.text = theResturants[indexPath.row].watcher
    cell.starLable.text = theResturants[indexPath.row].star
    cell.largeImage.image = UIImage(named: theResturants[indexPath.row].imageLarge)!
    cell.logoImage.image = UIImage(named: theResturants[indexPath.row].imageSmall)!

    return cell
     }

//    func performSegue(withIdentifier : "detaileView" , sender: self)
//             let targetSize = CGSize(width: 40, height: 40)
//             content.imageProperties.maximumSize = targetSize
//             content.image = theResturants[indexPath.row].imageLarge
//             content.image = theResturants[indexPath.row].imageSmall
//
//             content.text = theResturants[indexPath.row].
//
//             content.secondaryText = theResturants[indexPath.row].details
//             content.secondaryTextProperties.numberOfLines = 2
//
//             cell.contentConfiguration = content
//
//             return cell
//         }
//
//         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//             print("Row : \(indexPath.row)")
//
//             titleContent = arrayOfContact[indexPath.row].name
//             defaultImage = arrayOfContact[indexPath.row].image
//             descriptionText = arrayOfContact[indexPath.row].details
//
    
//    extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return theResturants.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = itemsTableView.dequeueReusableCell(withIdentifier: "cell") as! DetaileViewController
//        cell.imageSmall.image = UIImage(named: theResturants[indexPath.row].imageSmall)
//        cell.imageLarge.image = UIImage(named: theResturants[indexPath.row].)
//    }
//
    
}
