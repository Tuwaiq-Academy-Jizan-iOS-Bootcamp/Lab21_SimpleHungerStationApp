//
//  APIManager.swift
//  HamadHarisi_Lab21.0_SimpleHungerStationApp
//
//  Created by حمد الحريصي on 12/12/2021.
//

import Foundation

struct APIManager {
    static var shared =  APIManager()
    private let baseUrl = "https://hungerstation-api.herokuapp.com/api/v1/restaurants"
    func getData(endPoint:String, handler:@escaping ([Restorants])->())
    {
        let url = URL(string: baseUrl + endPoint)
        print("ERROR3")
        if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                print("ERROR4")
                if let error = error {
                    print("ERROR1",error .localizedDescription)
                }else{
                    if let data = data {

                        do {
                            let decoder = JSONDecoder()
                            let handlerrr = try decoder.decode([Restorants].self , from: data)
                            handler(handlerrr)
                        } catch  {
                            print("ERROR2")
                        }
                    }
                }
            }
            task.resume()
        }

    }
}
