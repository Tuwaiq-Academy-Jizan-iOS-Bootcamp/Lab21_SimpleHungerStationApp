import UIKit
class FoodMenu: UIViewController {
    @IBOutlet weak var menuTabelView: UITableView!
    var menu = Restorant.restorant[0].menu
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTabelView.delegate = self
        menuTabelView.dataSource = self
    }
}
extension FoodMenu:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTabelView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        var contant = cell.defaultContentConfiguration()
        contant.image = UIImage(named: menu[indexPath.row].name)
        contant.text = menu[indexPath.row].name
        contant.secondaryText = menu[indexPath.row].descreption
        contant.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        cell.contentConfiguration = contant
        return cell
    }
}
