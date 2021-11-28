//
//  MenuRestruantData.swift
//  HungerStationApp
//
//  Created by Abdulrhman Abuhyyh on 12/04/1443 AH.
//

import UIKit

class MenuRestruantData: UIViewController {

    var menuRest = Restrunt.restrants[0].menuOfRestruant
    @IBOutlet weak var menuTabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTabelView.delegate = self
        menuTabelView.dataSource = self
    
    }
}
extension MenuRestruantData:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuRest.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contant = cell.defaultContentConfiguration()
        contant.image = UIImage(named: menuRest[indexPath.row].imageMenu)
        contant.text = menuRest[indexPath.row].nameMeal
        contant.secondaryText = menuRest[indexPath.row].sar
        
        contant.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        cell.contentConfiguration = contant
        return cell
    }
  
 }

