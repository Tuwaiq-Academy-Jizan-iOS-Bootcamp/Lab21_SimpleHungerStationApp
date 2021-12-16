//
//  API.swift
//  JawaherAbuLahsah_HungerStationApp
//
//  Created by Jawaher Mohammad on 08/05/1443 AH.
//

import Foundation
struct API {
    static var shared =  API()
    private let baseUrl = "https://hungerstation-api.herokuapp.com/api/v1/"
    func getData<T:Codable>(endPoint:String, handler:@escaping (T)->()){
        let url = URL(string: baseUrl + endPoint)
        if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else{
                    if let data = data {
                        
                        do {
                            let decoder = JSONDecoder()
                            let gitData = try decoder.decode(T.self , from: data)
                            handler(gitData)
                        } catch  {
                            print("ERROR",error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
