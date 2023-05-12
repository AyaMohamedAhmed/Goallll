//
//  UPComingNetwork.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 05/05/2023.
//
//https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=e52ecd181c43330ca2817d83ad2ca66f343324dd638d18e240bdc67666bd0cad&from=2023-05-05&to=2023-05-07&leagueId=152

import Foundation

protocol upComingProtocol{
    static func fetchResult(complitionHandler:@escaping(Roots?)->Void,Update:String,Duration:String,legueId:String,type:String)
}
let MAIN_URLs:String = "https://apiv2.allsportsapi.com/"
let API_KEYs:String="&APIkey=ffde25f8eab70696f7cc8842782728bea92d1e2041342717607b0782889d9308"

class UpComingNetwork : upComingProtocol{
       
    static func fetchResult(complitionHandler:@escaping(Roots?)->Void,Update:String,Duration:String,legueId:String,type:String){
        
        
          var urlResult = MAIN_URLs+Update+API_KEYs+Duration+legueId
        
        let url = URL(string: urlResult)
        guard let newUrl = url else{
            return
        }
        let req = URLRequest(url: newUrl)
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: req) {data,response,error in
            
            switch(type){
            case "football":
                do{
                    let res = try JSONDecoder().decode(FootballRoot.self, from: data!)
                    complitionHandler(ConverterPojo.convertFixtureFootball(fixture: res))
                    
                }
                catch let error{
                    print(error.localizedDescription)
                    complitionHandler(nil)
                }
            case "basketball":
                do{
                    let res = try JSONDecoder().decode(BasketballRoot.self, from: data!)
                    complitionHandler(ConverterPojo.convertFixtureBasketball(fixture: res))
                    
                }
                catch let error{
                    print(error.localizedDescription)
                    complitionHandler(nil)
                }
            case "tennis":
                do{
                    let res = try JSONDecoder().decode(TennisRoot.self, from: data!)
                    complitionHandler(ConverterPojo.convertFixtureTennis(fixture: res))
                    
                }
                catch let error{
                    print(error.localizedDescription)
                    complitionHandler(nil)
                }
            case "cricket":
                do{
                    let res = try JSONDecoder().decode(CricketRoot.self, from: data!)
                    complitionHandler(ConverterPojo.convertFixtureCricket(fixture: res))
                    
                }
                catch let error{
                    print(error.localizedDescription)
                    complitionHandler(nil)
                }
            default:
                break
            }
     
            
            
        }
        task.resume()
    }
}
