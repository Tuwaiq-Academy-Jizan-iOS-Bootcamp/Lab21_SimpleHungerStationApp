//
//  MenuDelegate.swift
//  Hungerstation224
//
//  Created by موسى مسملي on 14/12/2021.
//

import UIKit
import Foundation
extension MenuController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
