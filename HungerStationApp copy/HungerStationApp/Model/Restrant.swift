////
//  Restorantss.swift
//  HungerStationApp
//
//  Created by Ahmad Barqi on 12/05/1443 AH.
//
struct Restorants:Codable {
    var data:[RestorantsData]
}
struct RestorantsData:Codable {
    var id: Int
    var name: String
//    الفئة
    var category: String
//    توصيل
    var delivery: Delivery
//    تقييم
    var rating: Double
//    تمت ترقيته
    var is_promoted: Bool
//    عرض
    var offer: Offer?
//    صورة
    var image: String
//    صورة المطعم
    var resturant_image:String
}
struct Delivery:Codable {
//    الوقت
    var time:Time
//    التكلفة
    var cost:Cost
}
struct Time:Codable {
//    دقيقة
    var min:Int
//اقصى
    var max:Int
}
struct Cost:Codable {
//    القيمة
    var value:Double
//    العملة
    var currency:String
}
struct Offer:Codable {
    
    var value:String
//    انفق
    var spend:Int
}
