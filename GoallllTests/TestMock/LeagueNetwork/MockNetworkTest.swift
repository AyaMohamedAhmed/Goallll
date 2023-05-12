//
//  MockNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//

import Foundation
@ testable import Goallll
import XCTest

class MockNetworkService{
    static let mockResponse = "{\"success\":1,\"result\":[{\"league_key\":4,\"league_name\":\"UEFAEuropaLeague\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":\"https:\\/\\/apiv2.allsportsapi.com\\/logo\\/logo_leagues\\/\",\"country_logo\":null},{\"league_key\":1,\"league_name\":\"EuropeanChampionship\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":null,\"country_logo\":null},{\"league_key\":683,\"league_name\":\"UEFAEuropaConferenceLeague\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":null,\"country_logo\":null},{\"league_key\":3,\"league_name\":\"UEFAChampionsLeague\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":\"https:\\/\\/apiv2.allsportsapi.com\\/logo\\/logo_leagues\\/3_uefa_champions_league.png\",\"country_logo\":null},{\"league_key\":633,\"league_name\":\"UEFANationsLeague\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":null,\"country_logo\":null}]}"
    
}
extension MockNetworkService:networkProtocol{
    static func fetchResult(complitionHandler: @escaping (Goallll.League?) -> Void, Update: String) {
        let data = Data(mockResponse.utf8)
        do{
            let res = try JSONDecoder().decode(League.self, from: data)
            complitionHandler(res)
        }catch let error{
            print(error.localizedDescription)
            complitionHandler(nil)
        }
    }
}

