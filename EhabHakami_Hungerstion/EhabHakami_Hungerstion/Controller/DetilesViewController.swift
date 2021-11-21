//
//  DetilesViewController.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 11/04/1443 AH.
//

import UIKit

class DetilesViewController: UIViewController {
    var detilesArray = DeliveryFood.restaurant[0].menuRestaurant
    
    
    
    @IBOutlet weak var detilesMyTableView: UITableView!
    var tableViewDitels = UITableView()
    
    @IBOutlet weak var detilesFoodImageView: UIImageView!
    var imageOfView = UIImage(named: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detilesMyTableView.delegate = self
        detilesMyTableView.dataSource = self
        
        detilesFoodImageView.image = imageOfView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetilesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detilesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTwo = tableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath)
        var content = cellTwo.defaultContentConfiguration()
        
        content.text = detilesArray[indexPath.row].nameFood
        let sizeimage = CGSize(width: 80, height: 80)
        content.imageProperties.maximumSize = sizeimage
        content.image = detilesArray[indexPath.row].photoFood
        content.secondaryText = detilesArray[indexPath.row].priceFood
        
        
        cellTwo.contentConfiguration = content
        return cellTwo
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        view.backgroundColor = .systemPink
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
//        let image = UIImage(
//        label.image = detilesArray[section.raw].photoFood
        
        
        label.textColor = .white
//        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
