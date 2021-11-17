//
//  MenuViewController.swift
//  restruntApp
//
//  Created by يوسف جابر المالكي on 12/04/1443 AH.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    var herfyMenu = Menu (name: "HERFY bjhg", price: "45 SR", describe: ";lkjhhhjhuhuhuhuuuyfrdeswrvbhnjjhgfdresehnj", image: UIImage(named: "M")!)
    @IBOutlet weak var headerImageMenu: UIImageView!
    @IBOutlet weak var logoVCMenu: UIImageView!
    @IBOutlet weak var restaruntNameVCMenu: UILabel!
    @IBOutlet weak var starVCMenu: UILabel!
    @IBOutlet weak var itemVCMenu: UILabel!
    @IBOutlet weak var priceVCMenu: UILabel!
    @IBOutlet weak var deliveryPriceMenu: UILabel!
    @IBOutlet weak var deliveryTimeVCMenu: UILabel!
  
    var items :[Menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        items.append(herfyMenu)
    }
}
extension MenuViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItems = menuTableView.dequeueReusableCell(withIdentifier: "menu", for: indexPath) as! MenuViewController
        
                
        
        
        
        <#code#>
    }
    
    
    
    
    
    
    
}
