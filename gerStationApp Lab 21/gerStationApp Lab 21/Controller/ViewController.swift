//
//  ViewController.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 10/04/1443 AH.
//

import UIKit

class ViewController: UIViewController{
    var dataHanger = Welcome(data: [])
    var selectedData: Datum?
    
    @IBOutlet weak var itemTableVieww: UITableView!{
        didSet {
            
            itemTableVieww.delegate = self
            itemTableVieww.dataSource = self
//                        itemTableVieww.register(UINib(nibName: "DataCell", bundle: nil),forCellReuseIdentifier: "ReuseCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.getData(endPoint: "/restaurants") { dataHanger in
                        self.dataHanger = dataHanger
            
            DispatchQueue.main.async {
                self.itemTableVieww.reloadData()
                
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = segue.destination as? DetailsViewController
        sender!.selectedData = selectedData
        
    }
    @IBAction func segueX(segue: UIStoryboardSegue){
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = dataHanger.data[indexPath.row]
        performSegue(withIdentifier: "ReuseCell", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataHanger.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ReuseCell", for: indexPath) as! ItemTableView
        cell.restaurantName.text = "\(dataHanger.data[indexPath.row].name)"
        cell.rating.text = "\(dataHanger.data[indexPath.row].rating)"
        cell.delivery.text = "\(dataHanger.data[indexPath.row].delivery.cost.value) \(dataHanger.data[indexPath.row].delivery.cost.currency)"
        cell.time.text = "\(dataHanger.data[indexPath.row].delivery.time.max) -\(dataHanger.data[indexPath.row].delivery.time.min) minutes"
        cell.category.text = dataHanger.data[indexPath.row].category
        cell.restaurantImage.loadImageUsingCache(with: dataHanger.data[indexPath.row].image)
        cell.logoImg.loadImageUsingCache(with: dataHanger.data[indexPath.row].resturant_image)
       
        if dataHanger.data[indexPath.row].is_promoted{
            cell.permted.text = "Promoted"
        }else {
            cell.permted.isHidden = true
        }
        if  let v = dataHanger.data[indexPath.row].offer?.value , let c = dataHanger.data[indexPath.row].offer?.spend {
            cell.offerLabel.text = "\(v) \(c)"

            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 300, y: 0))
            bezierPath.move(to: CGPoint(x: 260, y: 25))
            bezierPath.move(to: CGPoint(x: 0, y: 25))

            let shape = CAShapeLayer()
            shape.path = bezierPath.cgPath
            shape.fillColor = UIColor.systemBlue.cgColor
            cell.offerView.layer.addSublayer(shape)
            cell.offerView.addSubview(cell.offerLabel)
        }else {
            cell.offerView.isHidden = true
        }
        return cell
    }
}

    
//
//        }
