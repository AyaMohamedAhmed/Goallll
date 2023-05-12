//
//  Network.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 04/05/2023.
//

import Foundation
protocol networkProtocol{
    static func fetchResult(complitionHandler:@escaping(League?)->Void,Update:String)
}
let MAIN_URL:String = "https://apiv2.allsportsapi.com/"
let API_KEY:String="&APIkey=ffde25f8eab70696f7cc8842782728bea92d1e2041342717607b0782889d9308"

class Network : networkProtocol{
       
    static func fetchResult(complitionHandler:@escaping(League?)->Void,Update:String){
        var add:String=""
        var addUpdated:String{
            get{
                return add
            }
            set{
                add = newValue
            }
        }
        // Update: football/?met=Leagues"
        var urlResult = MAIN_URL+Update+API_KEY
        let url = URL(string: urlResult)
        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data,response,error in
            do{
                let res = try JSONDecoder().decode(League.self, from: data!)
                complitionHandler(res)
            }catch let error{
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
}
