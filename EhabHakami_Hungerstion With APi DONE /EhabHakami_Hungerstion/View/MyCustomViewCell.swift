//
//  MyCustomViewCell.swift
//  EhabHakami_Hungerstion
//
//  Created by Ehab Hakami on 10/04/1443 AH.
//

import Foundation
import UIKit

class MyCustomViewCell:UITableViewCell {
    
    
    @IBOutlet weak var promotedBtn: UIButton!
    
    
    @IBOutlet weak var restaurantBrandImageView: UIImageView!
    
    
    @IBOutlet weak var offersLabel: UILabel!
    
    
    //done
    @IBOutlet weak var photoFoodsImageView: UIImageView!
   
    
    //done
    @IBOutlet weak var deliveryOffersLabel: UILabel!
    var deliveryOffersText = ""
    
    
    ///////////done
    @IBOutlet weak var nameRestaurantLabel: UILabel!
    
    

    
    
    
    ///////////////done
    @IBOutlet weak var typeOfFoodLabel: UILabel!
    

    @IBOutlet weak var estimatedTimeOfArrivalLabel: UILabel!
   

    
    
    //no need detiles
    @IBOutlet weak var clockImageView: UIImageView!
    
    
    //no need detiles
    @IBOutlet weak var liveTrackLabel: UILabel!
    
    
    
    
    ////////
    @IBOutlet weak var rateTheFoodLabel: UILabel!
    

    
    
    ////////
    @IBOutlet weak var starImageView: UIImageView!
//    var starImage = UIImage(systemName: "star.fill")!

   
    
    
   

    
    
    
    
    
    
    


    
    @IBOutlet weak var muneImageView: UIImageView!
    
    
    @IBOutlet weak var nameMaleLabel: UILabel!
    
    
    @IBOutlet weak var discrabtionMilLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var colaresImage: UIImageView!
    
    
    @IBOutlet weak var valueCaluresLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //sameViewDidLoud

        
        deliveryOffersLabel?.sizeToFit()
        let path = UIBezierPath()
            path.move(to: .zero)
        path.addLine(to: CGPoint(x: offersLabel?.bounds.width ??  +50, y: 0))
        path.addLine(to: CGPoint(x: offersLabel?.bounds.width ?? +0 , y: 0))


            path.addLine(to: CGPoint(x: 0, y: 150))

            let shape = CAShapeLayer()
            shape.path = path.cgPath

        offersLabel?.layer.mask = shape
        
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    
    
}


