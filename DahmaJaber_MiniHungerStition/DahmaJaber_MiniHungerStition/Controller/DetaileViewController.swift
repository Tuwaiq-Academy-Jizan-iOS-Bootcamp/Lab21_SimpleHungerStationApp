//
//  DetaileViewController.swift
//  DahmaJaber_MiniHungerStition
//
//  Created by dahma alwani on 14/04/1443 AH.
//

import Foundation
import UIKit

class DetaileViewController : UIViewController {
   
    @IBOutlet weak var viewImageLarge: UIImageView!
    @IBOutlet weak var viewShow: UIView!
    @IBOutlet weak var detailsTableView: UITableView!
  
//         var minues :Minue?
         var minues : [Minue] = []

          override func viewDidLoad() {
             super.viewDidLoad()

              detailsTableView.delegate = self
              detailsTableView.dataSource = self
          }
    
    let theResturants = theResturants [] {
    titleLable.text = theResturants.title
    subtitleLable.text = theResturants.subtitle
    logoImage.image = UIImage(named :theResturants.imageSmall)
    largeImage.image = UIImage(named: theResturants.imageLarge)
    timerLable.text = theResturants.timer
 
}
   if firstTitleLabel.text ==  "Herfy" {
    minues = herfy
      }
   if firstTitleLabel.text == "Kudo" {
     minues = kudo
      }
   if firstTitleLabel.text == "Burger King" {
    minues = burgerKing
   }
}
 extension DetaileViewController: UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return minues.count
 }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CellMinue

     cell.firstTitleLabel.text = minues[indexPath.row].meal
    cell.priceLable.text = minues[indexPath.row].price
     cell.imageMeal.image =  UIImage(named:minues[indexPath.row].imageMeal)

          return cell
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                  return 200
             }

}
