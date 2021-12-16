//
//  APIManager.swift
//  gerStationApp Lab 21
//
//  Created by grand ahmad on 08/05/1443 AH.
//


import Foundation

struct APIManager {
    static var shared =  APIManager()
    private let baseUrl = "https://hungerstation-api.herokuapp.com/api/v1"
    func getData(endPoint:String, handler:@escaping (Welcome)->()){
        //we want the URL API data
        let url = URL(string: baseUrl + endPoint)
        //optional binding
        if let url = url {
            //create a session to make requests -> downloading data
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else{
                    if let data = data {                        do {
                            let decoder = JSONDecoder()
                            let dataHanger = try decoder.decode(Welcome.self , from: data)
                            handler(dataHanger)
                        } catch  {
                            
                            print("ERROR4",error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        } 
    }
    
}

