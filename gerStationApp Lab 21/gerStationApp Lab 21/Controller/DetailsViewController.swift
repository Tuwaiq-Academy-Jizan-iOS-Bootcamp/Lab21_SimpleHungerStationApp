//
//  DetailsViewController.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 10/04/1443 AH.
//
import Foundation
import UIKit
class DetailsViewController: UIViewController {
    var restorantMenu: Menus = Menus(menu: [])
    var selectedData: Datum?
    var id = 0
    @IBOutlet weak var menuTableView: UITableView!{
        didSet {
            menuTableView.delegate = self
            menuTableView.dataSource = self
        }
    }
    //    @IBOutlet weak var offersMenu: UILabel!
    @IBOutlet weak var viewTop: NSLayoutConstraint!
    @IBOutlet weak var tableViewTop: NSLayoutConstraint!
    @IBOutlet weak var viewBottom: NSLayoutConstraint!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var resturant_image: UIImageView!
    @IBOutlet weak var logoImege: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var delivery: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var offerViewVC2: UIView!
    @IBOutlet weak var offerLabelVC2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.layer.shadowColor = UIColor.black.cgColor
        topView.layer.shadowOpacity = 1
        topView.layer.shadowOffset = .zero
        topView.layer.shadowRadius = 10
        
        viewTop.constant = 140
        //scrollView.contentOffset.y -= 140
        //oldContentOffset = scrollView.contentOffset
        
        if let mn = selectedData{
            restaurantName.text = mn.name
            delivery.text = "\(mn.delivery.cost.value) - \(mn.delivery.cost.currency)"
            time.text = "\(mn.delivery.time.min) : \(mn.delivery.time.max)"
            rating.text = "\(mn.rating)"
            category.text = "\(mn.category)"
            logoImege.loadImageUsingCache(with: mn.resturant_image)
            resturant_image.loadImageUsingCache(with: mn.image)
            if  let v = mn.offer?.value , let c = mn.offer?.spend {
                //offerLabelVC2.text = "\(v) \(c)"
            }
            
            APIMenu.shared.getData(endPoint: "/restaurants/\(mn.id)") { restorantMenu in
                self.restorantMenu = restorantMenu
                DispatchQueue.main.async {
                    self.menuTableView.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let seguees = segue.destination as? DetailsViewController?
        seguees??.selectedData = selectedData
    }
    
    var oldContentOffset = CGPoint.zero
    let topConstraintRange = (CGFloat(100)..<CGFloat(140))
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta =  scrollView.contentOffset.y - oldContentOffset.y
        
        //we compress the top view
        if delta > 0 && viewTop.constant > topConstraintRange.lowerBound && scrollView.contentOffset.y > 0 {
            viewTop.constant -= delta
            scrollView.contentOffset.y -= delta
        }
        
        //we expand the top view
        if delta < 0 && viewTop.constant < topConstraintRange.upperBound && scrollView.contentOffset.y < 0{
            viewTop.constant -= delta
            scrollView.contentOffset.y -= delta
        }
        oldContentOffset = scrollView.contentOffset
    }
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        restorantMenu.menu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! ItemTableView
        cell.nameMenu.text = restorantMenu.menu[indexPath.row].title
        cell.price.text = "\(restorantMenu.menu[indexPath.row].price.value) - \(restorantMenu.menu[indexPath.row].price.currency)"
        cell.menuImg.loadImageUsingCache(with: restorantMenu.menu[indexPath.row].image)
        if restorantMenu.menu[indexPath.row].subtitle != nil{
            cell.decsription.text = restorantMenu.menu[indexPath.row].subtitle
        }else{
            cell.decsription.isHidden = true
        }
        if restorantMenu.menu[indexPath.row].calories != nil {
            
            cell.category1.text = "\(restorantMenu.menu[indexPath.row].calories!)"
        }else {
            cell.category1.isHidden = true
            cell.caloriesImage.isHidden = true
        }
        cell.price.text = "\(restorantMenu.menu[indexPath.row].price.value) - \(restorantMenu.menu[indexPath.row].price.currency)"
        return cell
    }
}

