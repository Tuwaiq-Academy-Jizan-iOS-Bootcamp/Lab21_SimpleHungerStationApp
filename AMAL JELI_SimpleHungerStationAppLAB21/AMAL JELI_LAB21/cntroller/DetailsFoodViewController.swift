//
//  DetailsViewo.swift
//  AMAL JELI_LAB21
//
//  Created by Amal Jeli on 10/04/1443 AH.
//

import Foundation
import UIKit
struct Mune {
    var nameOfTheFood:String
    var Price:String
    var imageOfTheFood:String
    
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var TableViewDetails: UITableView! {
        didSet{
            TableViewDetails.delegate = self
            TableViewDetails.dataSource = self
        }
    }
    
    @IBOutlet weak var imageSelectBackground: UIImageView!
    
    @IBOutlet weak var imageLogoView: UIImageView!
    
    @IBOutlet weak var nameOfResturant: UILabel!
    
    @IBOutlet weak var StarLable: UILabel!
    
    @IBOutlet weak var classificationResturant: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    var menueOceanBasket:[Mune]  = [ ]
    var  menueApplebees:[Mune] = []
    var  menuToastIt:[Mune] = []
    var meuneOfResturant:[Mune] = []
    var selectMenue:Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        var kingPrawns = Mune (nameOfTheFood: "king Prawns", Price: "70RS", imageOfTheFood: "king Prawns")
        var FusionCrunchsushi = Mune(nameOfTheFood: "Fusion crunch sushi", Price: "175RS", imageOfTheFood: "Fusion crunch sushi")
        var SoupTomYum =  Mune(nameOfTheFood: "Soup Tom Yum", Price: "30 RS", imageOfTheFood: "Soup Tom Yum")

        var ChiliCheeseNachos = Mune(nameOfTheFood: "Chili Cheese nachos", Price: "35RS", imageOfTheFood: "Chili Cheese nachos")
        var RibeyeSteak  = Mune(nameOfTheFood: "Ribeye Steak", Price: "140RS", imageOfTheFood: "Ribeye Steak")
        var RibsApplebees =  Mune(nameOfTheFood: "Ribs Applebees", Price: "98RS", imageOfTheFood: "Ribs Applebees")

       var GuacamoleEgg = Mune(nameOfTheFood: "Guacamole egg", Price: "10RS", imageOfTheFood: "Guacamole egg")
       var CheesyOmelette = Mune(nameOfTheFood: "Cheesy omelette", Price: "9RS", imageOfTheFood: "Cheesy omelette")
        var OrangeJuice = Mune(nameOfTheFood: "Orange Juice", Price: "10RS", imageOfTheFood: "Orange Juice")
    
    
        
        
//        var meuneOfResturant:[Mune] = []
//        var selectMenue:Food?
        
        
        menueOceanBasket.append(kingPrawns)
        menueOceanBasket.append(FusionCrunchsushi)
        menueOceanBasket.append(SoupTomYum)
        
        menueApplebees.append(ChiliCheeseNachos)
        menueApplebees.append(RibeyeSteak)
        menueApplebees.append(RibsApplebees)
        
        menuToastIt.append(GuacamoleEgg)
        menuToastIt.append(CheesyOmelette)
        menuToastIt.append(OrangeJuice)
        
        
        if let delivaryFood = selectMenue {
            
            
            nameOfResturant.text = delivaryFood.nameResturantLable1
            imageSelectBackground.image =  delivaryFood.imageFood1
            StarLable.text = delivaryFood.restaurantEvaluation1
            classificationResturant.text = delivaryFood.classificationFoodLabel1
            priceLabel.text = delivaryFood.foodDelivery1
            minutesLabel.text = delivaryFood.processingTimeLabel1

            
        }
        
        if nameOfResturant.text == "OceanBasket" {
            meuneOfResturant = menueOceanBasket
            
        }else if nameOfResturant.text == "Applebees" {
            meuneOfResturant = menueApplebees
            
        }else{
            
            meuneOfResturant = menuToastIt
        }
        
        
        
//       menueOceanBasket  = [Mune(nameOfTheFood: "king prawns", Price: "70 RS" , imageOfTheFood:UIImage(named: "king prawns")!, Mune(nameOfTheFood: "Fusion crunch sushi", Price: "175RS", imageOfTheFood: "Fusion crunch sushi"),Mune(nameOfTheFood: "Soup Tom Yum", Price: "30 RS", imageOfTheFood: "Soup Tom Yum"),Mune(nameOfTheFood: "Mojito juice", Price: "20RS", imageOfTheFood: "Mojito juice")]
//
//
//    menueApplebees = Mune(nameOfTheFood: "Chili Cheese nachos", Price: "35RS", imageOfTheFood: "Chili Cheese nachos",Mune(nameOfTheFood: "Ribeye Steak", Price: "140RS", imageOfTheFood: "Ribeye Steak"),Mune(nameOfTheFood: "Ribs Applebees", Price: "98RS", imageOfTheFood: "Ribs Applebees")]
//
//     menuToastIt = Mune(nameOfTheFood: "Guacamole egg", Price: "10RS", imageOfTheFood: "Guacamole egg",Mune(nameOfTheFood: "Cheesy omelette", Price: "9RS", imageOfTheFood: "Cheesy omelette"),Mune(nameOfTheFood: "Orange Juice", Price: "10RS", imageOfTheFood: "Orange Juice")]
//
//
    
  
    }
    
}
extension DetailsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meuneOfResturant.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

             }
    

        
    }
    

