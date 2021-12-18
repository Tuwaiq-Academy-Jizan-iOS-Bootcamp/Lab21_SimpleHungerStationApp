//
//  APIManeger.swift
//  ArwaAlattas_HungerStation
//
//  Created by Arwa Alattas on 08/05/1443 AH.
//

import Foundation
struct APIManager {
    static var shared =  APIManager()
  private let baseUrl = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
    func getData(handler:@escaping (Resturant)->()){
        //we want the URL API data
        let url = URL(string: baseUrl )
        //optional binding
        if let url = url {
            //create a session to make requests -> downloading data
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                if let error = error {
                    print("ERROR",error)
                }else{
                    if let data = data {
                        
                        do {
                            let decoder = JSONDecoder()
                            let resturants = try decoder.decode(Resturant.self , from: data)
                            handler(resturants)
                        } catch  {
                            print("ERROR")
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func getDataMenu(endPoint:String,handler:@escaping (Menus)->()){
        //we want the URL API data
        let url = URL(string: baseUrl + endPoint )
        //optional binding
        if let url = url {
            //create a session to make requests -> downloading data
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                if let error = error {
                    print("ERRORkkkkk",error)
                }else{
                    if let data = data {
                        
                        do {
                            let decoder = JSONDecoder()
                            let menus = try decoder.decode(Menus.self , from: data)
                            handler(menus)
                        } catch  {
                            print("ERROR")
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    
}
