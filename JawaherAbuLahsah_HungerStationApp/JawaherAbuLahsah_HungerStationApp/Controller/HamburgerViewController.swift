//
//  HamburgerViewController.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 10/05/1443 AH.
//

import Foundation
import UIKit


protocol HamburgerMenuControllerDelegate{
    func hideHamburgerMenu()
}

class HamburgerViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var hamburgerMenuTable: UITableView!
    
    
    var delegate :HamburgerMenuControllerDelegate?
    var hamburgerMenuInfo = ""
    var hamburgerMenuContent = ["Information about app","Map","Information about developer"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hamburgerMenuContent.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHamburger", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = hamburgerMenuContent[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.hideHamburgerMenu()
        
        hamburgerMenuInfo = hamburgerMenuContent[indexPath.row]
        performSegue(withIdentifier: "segueInformation", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as! InformationsViewController
        sender.hamburgerMenuInfo = hamburgerMenuInfo
    }
}

