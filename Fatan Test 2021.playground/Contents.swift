//import UIKit
//
//var age = 11
//                                                   //////////////////////
//if age < 12 {
//print ("sorry,you are not old enough to play this game.")
//
//}else {
//    print("Welcome to the game")
//}
// بتنفيذ طباعة جملة الاف اذا كان الشرط متحقق يعني يكون الشرط صحيح
//واذا لم يتحقق شرط جملة الاف يقوم بطباعة الخيار الثاني الاس

//import Foundation

//نتعرف علي جملة الطباعة الاف الس اف
//let number = 7
//
//if number > 0 {
//    print ("+")
//}else if number < 0 {
//print ("-")
//}else{ number == 0
//    print("zero")
//}
//********************************************************************************************************
//طباعة حروف الكلمة Litter
//var name = "Fatan Abdullah"
//for i in name{
//    print(i)
//
//}
//*********************************************************************************************
//طريقة طباعة المصفوفه في اوسط منفرده
//var dde = [10,20,30,40,50,60,70,80,90,100]
//for i in dde{
//    print(i)
//}
//*************************************************************************************************
//طباعة اكبر رقم في المصفوفه
//var arrayNumbers = [10,20,30,40,50,60,70,80,90,100]
//var Max = arrayNumbers[0]
//for AAB in arrayNumbers{
//    if(AAB > Max){
//        Max = AAB
//    }
//}
//print(Max)

//طباعة اصغر رقم في المصفوفه نفسه بس اغير الاشاره من الاكبر للاصغر.

//***************************************************************************************************
//نعرف متغير يطبع كل من انواع البيانات// Int,Double,Float//
//numbers******

//var i = 2
//var F : Float = 4.5
//var D : Double = 4.7
//print(Double(i) + Double(F) + D)

//******************************************************************************************************
////سوال النجوم الحل الاول
////func drawStars(n:Int) {
////var output = ""
////for _ in 1...n {
////    output += "*"
////   print(output)
////}
////
////}
//drawStars(n: 4)
//الحل الثاني


//

////var array: = [1,2,3,4,5]
////func index(arr:[String]) ->Int {
////
//var avareg = [1,2,3,4,5,6]
//var sum = 0
//for num in avareg{
//    sum += num
//}
//print( Float(sum) / Float(avareg.count))

//func findAvarge(arr:[Int])-> Float {
//   var sum = 0
//   for num in arr {
//      sum += num
//  }
//    return Float(sum)/Float(arr.count)
//}
//func findAvarge(arr:[Int])-> Float {
//   var sum = 0
//    for num in arr {
//       sum += num
//   }
//return Float(sum)/Float(arr.count)
//
//}
//
//func findAverag(arr:[Int]) -> Float
//var sum = 0
//for num in arr{
//    sum += num
//}
//return (Float(sum) / Float(arr.count)
//
//}
//print
//*********************************************************************************************
//طباعة جيع عناصر المصفوفه من الاكبر للاصغر
//var listOfNumber = [1,2,3,10,100]
//
//var i = listOfNumber.count - 1
//while i >= 0 {
//   print(listOfNumber[i])
//   i -= 1
//}
//***************************************************************************************************

//طباعة الارقام الزوجية في المصفوفه
//var listOfNumber = [1,2,3,10,100]
//print("Odd-------------------")
//// print all Odd number from your Array
//var number = 2
//for i in listOfNumber {
//if nu
//*********************************************************************************************************
//class Father{
//
//var fristName:String
//var listName:String
//var age:Int
//
//init(firstName:String,listName:String, age:Int) {
//
//self.fristName = firstName
//self.listName = listName
//self.age = age
//}
//}
//class Son:Father{
//func Jump(){
//    let jump = Int.random(in: 1...3)
//    print("I can jump \(jump) m")
//
//}
//
//}
//class Daugther:Father {
//func Jump() {
//    let jump = Int.random(in: 1...3)
//    print("I can jump \(jump) m")
//}
//
//}
//    var fatan = Son.init(firstName: "fatan", listName: "Abdullah", age: 26)
//    var majed = Daugther.init(firstName: "majed", listName: "Abdullah", age: 26)
//    fatan.Jump()
//    majed.Jump()
//
//********************************************************************************************
//طباعة العدد الزوجي "بالرنج"
//var arrayNumber = [1,2,3,4,5,6,7,8,9,10]
//for x in 0...10 {
//if x % 2 == 0 {
//        print(x)
//    }
//}



//طباعة جميع العناصر في المصفوفه.........................................
//var arr = ["one","two","three"]
//for i in arr {
//    print(i)
//}
//.............................
//var arr = [["one","two","three"] ,["four","five"]]
//for i in arr {
//    for j in i {
//        print(j)
//    }
//}
//................................................................................

//طريقة كتابة المصفوفة والتعديل عليها لاضافة عنصر اليها وحذف عنصر معين
//var weekDays :[String] = ["sunday","monday"]
//
//weekDays.append("tuesday")
//weekDays.remove(at:[0]
//print(weekDays[1])
////.............................................................................................................................
//طباعة عناصر المصفوفه واقسمها علي عددها
//Avareg
//var avareg = [1,2,3,4,5,6]
//var sum = 0
//for num in avareg{
//    sum += num
//}
//print( Float(sum) / Float(avareg.count))





//طباعة حروف اسمي
//var name = "Fatan"
//
//for i in name{
//    print(i)
//}
//""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
//var number = 20
//if number > 30{
//    print("**")
//}else if number < 10 {
//    print("$$$$")
//}else{
//    print("%")
//}
////************************************
//switch number {
//case 0:
//print("*")

//var student = ["norr","fatan","lmae"]
//for index in 0..<student.count {
//
//   print (student[index])
//}
////-------------------------------------
//for item in student{
//print(item)
//}
//???????????????????????????????????
//var age = 22
//
//if  age > 18 {
//
//print("I can drive")
//
//}
//
//else if age < 10 {
//
//print("too young to drive")
//
//}else{ age = 20
//
//}

//class Device {
//}
//var id:Int
//var name: String
//var colos:String
//
//
//
//class Iphone {
//}
//var width:Int
//var heiggt:Int
//
// property_getAttributes()
//
////""""""""""""""""""""""""""""""""""
//enum Status {
//
//case pending
//
//case done
//
//case rejected
//
//}
//print()
//func checkStatus()->String {
//

    
//var mAction
//
//case backword :
//
//print("go back")
//
//case forward :
//
//print("go forward")
//
//case stop:
//print("stop")
//
//default
//print(**)
//
//}
//var nameArr = ["one","two","three", "We Love Saudi"]
//for item in nameArr{
//    print(item)
//}
//protocol Flyable {
//
//func myProtocol()
//
//
//}
//
//struct Plane {
//}
//var name = "norr"

//var studentAge:[String:Int]=["fatan":26,"norah":25,"marem":29,]
//studentAge["fatmah"] = 22
//print(studentAge)
//studentAge["soud"] = 23
//print(studentAge)
//var studentGrades:[String:Int]=["fatan":50,"norah":40,"Amal":30,"sarah":10]
//
//var number:Float = 4.9

//struct Person {
//var clothes:[String]
//var shoes:String
//}

//protocol Flyable{
//
//func prottocol(){
//
//print("Hello swift")
//
//struct Plane{
//}
//var trafficLight = "colors"
//
//switch trafficLight{
//
//case "Green":
//            print("Go")
//case "Yellow":
//
//        print("SlowDown")
//case "Red":
//        print("Stop")
//
//default:
//    print("bloue")
//}
//enum Number{
//case num1
//
//case num2
//
//case num3
//
//}

//class Area {
//}
//var width:Int
//var height:Int
//
//init(width:[Double] 5.5, height:[Double] 6.6)
//self.width = width
//self.height = height
//}
//func coloreNumber()->Int {
//
//var num = number1 + number2
//
//   ( number1 = 10,number2 = 5)
//
//return coloreNumber()
//}
//var nameArr=["One","two","three"]
//for item in nameArr{
//print(item)
//}
//var name = "Abdullah"
//for i in name{
//   print(i)
//}

//var age:Int! = 22
//
//print(age)
//var closure = {
//print("Happy birthday!")
//
//}
//class Animal {
//var name:String
//
//var age:String
//    init(name:String,age:String)
//}
//func information()
//print("name"/age)


//func number(){
//
//var arrayNumbers = [50,40,30,20,10]
//
//var Min = arrayNumbers[0]
//
//for ele in arrayNumbers{
//if(ele < Min){
//Min = ele
//      }
//    }
//    print(Min)
//}

//func addNumbers(number1:Int, number2:Double) -> result {
//
//    var result = number1 + number2
//
//    return result
//
//    var x = addNumbers(number1: 5, number2: 10.5)
//}


//func addNumbers(number1:String, number2:String) -> true || false {
//
//var arrayNumbers["One","two","three","four"]60
//
//    return true  || false
//
//}
//func score(arr:[String:Int]) -> {
//
//return
//
//score(["ahmad":33,"mahmoud":55,"rula":60])
//
//}
//var age = 22
//
//if  age > 18 {
//
//return true
//
//print("I can drive")
//
//return false
//}
//else if age < 10 {
//
//print("too young to drive")
//return false
//
//}else{ age = 20
//
//}
//class Device {
//}
//var id:Int
//var name: String
//var colos:String
//init(id:"id",name:"name",colos:"colos")
//
//class Iphone:Device {
//}
//var width:Int
//var heiggt:Int
//var size:Int
//
//property()

//Create a class called Device that has id of type int and name of type string and colors as array of string

//Then create another class called Iphone that has width and height of type int and create a property called size of type int that will be computed based on the width and height and a method that will print the Iphone name and size

//class Device {
//    var id:Int
//    var name:String
//    var colors:[String]
//
//    init(id:Int,name:String,colors:[String]){
//        self.id = id
//        self.name = name
//        self.colors = colors
//    }
//}
////var ss = Device(id: 3, name: "sss", colors: ["yyy"])
//
//class Iphone:Device {
//    var width:Int
//    var height:Int
//    var size:Int{
//    width * height
//    }
//}
//
//
//
//func isDivideBy(number:Int,a:Int,b:Int)->Bool {}
//
//if number


    
//var ops = [""]
//
//var record:[Int]=[]

//func gameResult(ops:[String])->Int {
//
//let number = 0
//
//for index in 0...withOps.count -1 {
//
//let decimalCharacter = CharacterSet.decimalDigits
//
//    if (withOps[index].rangeOfCharacter(from: decimalCharacter)! nil){
//        record.append(Int(withOps[index])!)
//    }
//    if withOps[index] == "+" {
//    let sizeOfRecord = record.count -1
//     numberOne = record[sizeOfRecord -1]
//        numberTwo = record.last!
//
//        record.append(numberOne+numberTwo)
//    }
//if withOps[index] == "D"
//?????????????????????????????????????????????????????????????????????????????
//class Animal {
//   // properies
//var kind:String
//var numOfFeet:Int
//var ableToFly:Bool
//
//init(kind:String,numOfFeet:Int,ableToFly:Bool){
//self.kind = kind
//self.numOfFeet = numOfFeet
//self.ableToFly = ableToFly
//
//}
//// behaviors
//
//func move(){
//        print("the animal is moving")
//}
//func jump(){
//        print("the animal is jumping")
//    }
//func fly(){
//    if ableToFly == true {
//    print("the \(kind)animal is flying")
//    }else {
//    print("\(kind) cannot fly")
//    }
//
//}
//


//var rabbit = Animal(kind: "rabbit", numOfFeet: 4, ableToFly: false)
//var lion = Animal(kind: "lion", numOfFeet: 4, ableToFly: false)
//var bird = Animal(kind: "bird", numOfFeet: 2, ableToFly: true)
//
//}
//
//bird.fly()

//?????????????????????????????????????????????

//func sumOps(ops:[String])->Int{
//    var  x:[Int]=[]
//    var sum = 0
//    
//for i in ops {
//if i == "C" {
//x.remove(at: x.count-1)
//            
//}else if i == "D" {
//x.append(x[x.count-1]*2)
//                    
//}else if i == "+" {
//x.append(x[x.count-2] + x[x.count-1])
//            
//}else{
//x.append(Int(i)!)
//        }
//}
//for i in x {
//    sum += i
//}
//return sum
//
//}
//
//sumOps(ops: ["5","-2","4","C","D","9","+","+"])
//
