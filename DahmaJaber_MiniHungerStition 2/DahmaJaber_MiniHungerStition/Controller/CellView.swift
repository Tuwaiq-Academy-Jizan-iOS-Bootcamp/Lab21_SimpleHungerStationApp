import UIKit


class CellView: UITableViewCell {
    
    @IBOutlet weak var nameOfResturantLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var trackingLable: UILabel!
    @IBOutlet weak var ratingLable: UILabel!
//    @IBOutlet weak var minMaxLable: UILabel!
    @IBOutlet weak var resturantImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var deliverayPriceLabel: UILabel!
    @IBOutlet weak var promotedLabel: UILabel!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var offerLabel: UILabel!
//    {
//        didSet{
//            offerLabel.text = ""
//            offerLabel.sizeToFit()
//        }
//    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let path = UIBezierPath()
//        path.move(to: .zero)
//        path.addLine(to: CGPoint(x: 300, y: 0))
//        path.addLine(to: CGPoint(x: 200, y: 25))
//        path.addLine(to: CGPoint(x: 0, y: 25))
//
//        let shape = CAShapeLayer()
//        shape.path = path.cgPath
//        offerView?.layer.mask = shape
//
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
