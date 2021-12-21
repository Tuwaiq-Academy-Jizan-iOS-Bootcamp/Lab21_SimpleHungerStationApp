import UIKit
class RestorantCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var restorandFoodImage: UIImageView!
    @IBOutlet weak var restorantName: UILabel!
    @IBOutlet weak var foodType: UILabel!
    @IBOutlet weak var deliveryAndOtherThings: UILabel!
    @IBOutlet weak var raiting: UILabel!
    @IBOutlet weak var priceCondition: UILabel!
    @IBOutlet weak var promoted: UILabel!
    let triangleCorner = UIView()
    override func awakeFromNib() {
        super.awakeFromNib()
        makeTriangleCorner()
        triangleCorner.translatesAutoresizingMaskIntoConstraints = false
    }
    func makeTriangleCorner() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 20, y: 0))
        path.addLine(to: CGPoint(x: 0, y: priceCondition.frame.height))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.systemBlue.cgColor
        triangleCorner.layer.addSublayer(shapeLayer)
    }
}
