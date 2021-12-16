
import Foundation

struct Restaurant:Codable{
    var data:[DataR]
}
struct DataR:Codable{
    var id :Int
    var name :String
    var category:String
    var delivery:Delivery
    var rating:Float
    var is_promoted:Bool
    var offer:Offer?
    var image:String
    var resturant_image:String
    
}
struct Delivery:Codable{
    var time:Time
    var cost:Cost
    
}
struct Offer:Codable{
    var value:String
    var spend:Int
    
    
}
struct Time:Codable{
    var min:Int
    var max:Int
    
}
struct Cost:Codable{
    var value:Double
    var currency:String
}
