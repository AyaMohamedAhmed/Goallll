//
//  TennisPlayerNetwork.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//
//https://apiv2.allsportsapi.com/tennis/?met=Players&playerId=3618&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4

import Foundation
protocol TennisplayersProtocol{
    static func fetchResult(complitionHandler:@escaping(TennisPlayerRoot?)->Void,Update:String)
}

class TennisPlayerNetwork : TennisplayersProtocol{
       
    static func fetchResult(complitionHandler:@escaping(TennisPlayerRoot?)->Void,Update:String){
               
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
                let res = try JSONDecoder().decode(TennisPlayerRoot.self, from: data!)
                complitionHandler(res)
            }catch let error{
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
}
