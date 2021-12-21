import UIKit
import Foundation
extension MenuViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newHeight = scrollView.contentOffset.y
        // View Size
        if heightOfView.constant > 324 {
            heightOfView.constant = 324
        }else if heightOfView.constant < 230 {
            heightOfView.constant = 230
        }
        // Header Height
        if headerHeight.constant > 132 {
            headerHeight.constant = 132
        }else if headerHeight.constant < 85 {
            headerHeight.constant = 85
        }
        // Header Size
        if headerSize.constant > 120 {
            headerSize.constant = 120
        }else if headerSize.constant < 75 {
            headerSize.constant = 75
        }
        // Oborations
        heightOfView.constant -= newHeight
        headerHeight.constant -= newHeight / 2
        headerSize.constant -= newHeight / 2
    }
}
