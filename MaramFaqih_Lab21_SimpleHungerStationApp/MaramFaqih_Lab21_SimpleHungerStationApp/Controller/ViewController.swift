//
//  ViewController.swift
//  MaramFaqih_Lab21_SimpleHungerStationApp
//
//  Created by meme f on 10/04/1443 AH.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headerImageView: UIImageView!
    var imagesOnView : [String] = []
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagesOnView = ["h1","h2","h3","h4"]
        headerImageView.layer.cornerRadius = 0.1 *  headerImageView.bounds.size.height
        headerImageView.layer.masksToBounds = true
    }


    @IBAction func headerTapGestur(_ sender: UITapGestureRecognizer) {
        print("ddd")
    }
    
    @IBAction func headerSwipeGesturRight(_ sender: UISwipeGestureRecognizer) {
        if (index != 0){
            index -= 1
            }else{
                index = imagesOnView.count-1
            }
        headerImageView.image=UIImage(named: imagesOnView[index])
  
       
    }
    @IBAction func headerSwipeGesturLeft(_ sender: UISwipeGestureRecognizer) {
        if (index != imagesOnView.count-1){
            index += 1
            }else{
                index = 0
            }
        headerImageView.image=UIImage(named: imagesOnView[index])
     
        
    }
}

