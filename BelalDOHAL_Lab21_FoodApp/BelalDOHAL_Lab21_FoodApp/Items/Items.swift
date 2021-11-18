import Foundation
struct Menu {
    var price:String
    var name:String
    var descreption:String
}
struct Restorant {
    var logo:String
    var restorantName:String
    var foodType:String
    var minemumTimeOfDelivery:Int
    var maximumTimeOfDelivery:Int
    var deliveryPrice:Int
    var stars:Double
    var priceCondition:String?
    var menu = [Menu]()
    static var restorant = [
        Restorant(logo: "logo1",
                  restorantName: "Restorant1",
                  foodType: "Hunter Food",
                  minemumTimeOfDelivery: 45,
                  maximumTimeOfDelivery: 55,
                  deliveryPrice: 5,
                  stars: 2.0,
                  priceCondition: nil,
                  menu: [
            Menu(price: "Mony",
                 name: "foodmenu1",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu1",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu1",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu1",
                 descreption: "Food")]),
        Restorant(logo: "logo2",
                  restorantName: "Restorant2",
                  foodType: "Hunter Food",
                  minemumTimeOfDelivery: 40,
                  maximumTimeOfDelivery: 50,
                  deliveryPrice: 10,
                  stars: 3.3,
                  priceCondition:"I Don't Care",
                  menu: [
            Menu(price: "Mony",
                 name: "foodmenu2",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu2",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu2",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu2",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu2",
                 descreption: "Food")]),
        Restorant(logo: "logo3",
                  restorantName: "Restorant3",
                  foodType: "Hunter Food",
                  minemumTimeOfDelivery: 45,
                  maximumTimeOfDelivery: 50,
                  deliveryPrice: 15,
                  stars: 1.7,
                  priceCondition: "Get it by your self",
                  menu: [
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food"),
            Menu(price: "Mony",
                 name: "foodmenu3",
                 descreption: "Food")])
    ]
}





