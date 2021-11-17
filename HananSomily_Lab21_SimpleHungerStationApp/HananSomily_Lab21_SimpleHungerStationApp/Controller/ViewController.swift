//
//  ViewController.swift
//  HananSomily_Lab21_SimpleHungerStationApp
//
//  Created by Hanan Somily on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var collectonImageView: UICollectionView! {
        didSet{
            collectonImageView.delegate = self
            collectonImageView.dataSource = self
        }
    }
    
    @IBOutlet weak var View1: UIImageView!
    var i = 0
    var resturant:[UIImage] = []
    //["aselBorger","borgerKing","herfy"]
    var select :HungerStationItem?
    @IBOutlet weak var hungerStationTableView: UITableView! {
        didSet {
            hungerStationTableView.delegate = self
            hungerStationTableView.dataSource = self
        }
    }
    
    var foodHungerStation:[HungerStationItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
resturant = [UIImage(named:"aselBorger")!,UIImage(named: "borgerKing")!,UIImage(named: "herfy")!]

        // Do any additional setup after loading the view.
        foodHungerStation =  [HungerStationItem(logo:UIImage(named: "logoAseelBorger")!,image:UIImage(named: "aselBorger")!, name: "Asel Borger", discription: ".. Fast food .. ", price: "30 SAR", cookingTime: "30 - 40 munites", deleveryTime: "30 munites", evalution: "4.8" ), HungerStationItem(logo:UIImage(named: "logoburgerking")!,image: UIImage(named: "borgerKing")!, name: "Borger King", discription: " ...Fast food...", price: "45 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: "3.9"),HungerStationItem(logo:UIImage(named: "logoHerfyar")!,image: UIImage(named: "herfy")!, name: "Herfy", discription: " . Fast food . ", price: "35 SAR ", cookingTime: "40 -50 muntes ", deleveryTime: "20 Munites ", evalution: "3.9 ")]
    }

//    @IBAction func swipLeft(_ sender: UISwipeGestureRecognizer) {
//        if i != 0 {
//        i -= 1
//        } else {
//            i = resturant.count-1 }
//    View1.image = UIImage(named: resturant[i])
//        }
//
//    @IBAction func swipRight(_ sender: UISwipeGestureRecognizer) {
//        if i != resturant.count - 1 {
//            i += 1
//        } else {
//            i = 0 }
//    View1.image = UIImage(named: resturant[i])
//        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let send = segue.destination as! MenuViewController
        send.selected = select
        
    }
}

extension ViewController :UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //foodHungerStation.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodHungerStation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as!
        ClassHungerStationTableView
        //StructureHungerStation
        let content = foodHungerStation[indexPath.row]
        cell.printElement(logoo:content.logo , imagee: content.image , name: content.name , description: content.discription, timeCook: content.cookingTime, timeDelever: content.deleveryTime , evaluteStar: content.evalution)

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        select = foodHungerStation[indexPath.row]
        performSegue(withIdentifier: "sender", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
//    func tableView(_ tableView: UITableView, viewForHeader section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 40))
//        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.width, height: 40))
//        view.backgroundColor = .systemYellow
//        label.text = "Hunger Station"
//        label.textColor = .white
//        label.textAlignment = .center
//        view.addSubview(label)
//        return view
//    }
//    func tableView(_ tableView: UITableView, heightForHeader section: Int) -> CGFloat {
//        return 70
//    }
    
}
extension ViewController:UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resturant.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgeView", for: indexPath) as! ImageViewCell
        cell.viewPannar.image = resturant[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
