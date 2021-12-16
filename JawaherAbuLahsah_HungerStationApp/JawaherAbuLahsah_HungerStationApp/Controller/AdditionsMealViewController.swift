//
//  AdditionsMealViewController.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 12/04/1443 AH.
//

import Foundation
import UIKit
class AdditionsMealViewController:UIViewController{
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var additionTableView: UITableView!
    
    var additions = ["a","b","c","d"]
    var image1 = UIImage()
    override func viewDidLoad() {
        mealImageView.image = image1
    }
    
    
}
extension AdditionsMealViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return additions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellElements
        
        cell.additionsLabel.text = additions[indexPath.row]
        //cell.addButton.tag = indexPath.row
        cell.addButton.addTarget(self, action: #selector(addToMeal(sender:)), for: .touchUpInside)
        return cell
    }
    @objc
    func addToMeal(sender: UIButton){
        sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
}
