//
//  PlayersNetwork.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//

import Foundation
protocol playersProtocol{
    static func fetchResult(complitionHandler:@escaping(PlayerRoot?)->Void,Update:String)
}
let AURL:String = "https://apiv2.allsportsapi.com/"
let KEY:String="&APIkey=ffde25f8eab70696f7cc8842782728bea92d1e2041342717607b0782889d9308"

class PlayerNetwork : playersProtocol{
       
    static func fetchResult(complitionHandler:@escaping(PlayerRoot?)->Void,Update:String){
               
        var urlResult = AURL+Update+KEY
        print(urlResult)
        let url = URL(string: urlResult)
        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data,response,error in
            do{
                let res = try JSONDecoder().decode(PlayerRoot.self, from: data!)
                complitionHandler(res)
            }catch let error{
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
}
