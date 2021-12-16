


import Foundation

struct APIManager {
    static var shared =  APIManager()
    private let baseUrl = "https://hungerstation-api.herokuapp.com/api/v1"
    func getData(endPoint:String, handler:@escaping ([RestorantsData])->()){
        //we want the URL API data
        let url = URL(string: baseUrl + endPoint)
        //optional binding
        if let url = url {
            //create a session to make requests -> downloading data
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respon, error in
                
                if let error = error {
                    print("eRROR",error)
                }else{
                    if let data = data {
                        
                        do {
                            let decoder = JSONDecoder()
                            let digimons = try decoder.decode([RestorantsData].self , from: data)
                            handler(digimons)
                        } catch  {
                            //if something wrong
                            print("E0RROR")
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
