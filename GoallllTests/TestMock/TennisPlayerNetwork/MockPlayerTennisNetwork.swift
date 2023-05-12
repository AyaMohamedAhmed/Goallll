//
//  MockPlayerNetwork.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//

import Foundation
@ testable import Goallll
import XCTest

class MockPlayerTennisNetwork{
    static let playerResponse = "{\"success\":1,\"result\":[{\"player_key\":3618,\"player_name\":\"Borges\\/Cabral\",\"player_country\":\"Portugal\",\"player_bday\":\"19.02.1997\",\"player_logo\":null,\"stats\":[{\"season\":\"2022\",\"type\":\"doubles\",\"rank\":\"148\",\"titles\":\"0\",\"matches_won\":\"2\",\"matches_lost\":\"1\",\"hard_won\":\"1\",\"hard_lost\":\"1\",\"clay_won\":\"1\",\"clay_lost\":\"0\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2021\",\"type\":\"doubles\",\"rank\":\"159\",\"titles\":\"8\",\"matches_won\":\"42\",\"matches_lost\":\"8\",\"hard_won\":\"8\",\"hard_lost\":\"1\",\"clay_won\":\"34\",\"clay_lost\":\"6\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2020\",\"type\":\"doubles\",\"rank\":\"517\",\"titles\":\"0\",\"matches_won\":\"13\",\"matches_lost\":\"8\",\"hard_won\":\"8\",\"hard_lost\":\"5\",\"clay_won\":\"5\",\"clay_lost\":\"3\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2019\",\"type\":\"doubles\",\"rank\":\"965\",\"titles\":\"0\",\"matches_won\":\"0\",\"matches_lost\":\"1\",\"hard_won\":\"\",\"hard_lost\":\"\",\"clay_won\":\"0\",\"clay_lost\":\"1\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2022\",\"type\":\"singles\",\"rank\":\"161\",\"titles\":\"0\",\"matches_won\":\"8\",\"matches_lost\":\"2\",\"hard_won\":\"5\",\"hard_lost\":\"2\",\"clay_won\":\"3\",\"clay_lost\":\"0\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2021\",\"type\":\"singles\",\"rank\":\"194\",\"titles\":\"2\",\"matches_won\":\"52\",\"matches_lost\":\"21\",\"hard_won\":\"6\",\"hard_lost\":\"4\",\"clay_won\":\"46\",\"clay_lost\":\"17\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2020\",\"type\":\"singles\",\"rank\":\"398\",\"titles\":\"3\",\"matches_won\":\"31\",\"matches_lost\":\"7\",\"hard_won\":\"29\",\"hard_lost\":\"4\",\"clay_won\":\"2\",\"clay_lost\":\"3\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2019\",\"type\":\"singles\",\"rank\":\"675\",\"titles\":\"0\",\"matches_won\":\"1\",\"matches_lost\":\"2\",\"hard_won\":\"0\",\"hard_lost\":\"1\",\"clay_won\":\"1\",\"clay_lost\":\"1\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2018\",\"type\":\"singles\",\"rank\":\"636\",\"titles\":\"1\",\"matches_won\":\"7\",\"matches_lost\":\"1\",\"hard_won\":\"2\",\"hard_lost\":\"1\",\"clay_won\":\"5\",\"clay_lost\":\"0\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2017\",\"type\":\"singles\",\"rank\":\"539\",\"titles\":\"0\",\"matches_won\":\"4\",\"matches_lost\":\"2\",\"hard_won\":\"1\",\"hard_lost\":\"1\",\"clay_won\":\"3\",\"clay_lost\":\"1\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2016\",\"type\":\"singles\",\"rank\":\"1293\",\"titles\":\"0\",\"matches_won\":\"0\",\"matches_lost\":\"1\",\"hard_won\":\"\",\"hard_lost\":\"\",\"clay_won\":\"0\",\"clay_lost\":\"1\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2015\",\"type\":\"singles\",\"rank\":\"1282\",\"titles\":\"0\",\"matches_won\":\"1\",\"matches_lost\":\"2\",\"hard_won\":\"0\",\"hard_lost\":\"1\",\"clay_won\":\"1\",\"clay_lost\":\"1\",\"grass_won\":\"\",\"grass_lost\":\"\"}],\"tournaments\":[{\"name\":\"Antalya3(Challenger)\",\"season\":\"2021\",\"type\":\"singles\",\"surface\":\"clay\",\"prize\":\"\\u20ac31,440\"},{\"name\":\"M15Antalya5(ITF)\",\"season\":\"2021\",\"type\":\"singles\",\"surface\":\"clay\",\"prize\":\"$15,000\"},{\"name\":\"M15QuintaDoLago(ITF)\",\"season\":\"2020\",\"type\":\"singles\",\"surface\":\"hard\",\"prize\":\"$15,000\"},{\"name\":\"M15Sintra(ITF)\",\"season\":\"2020\",\"type\":\"singles\",\"surface\":\"hard\",\"prize\":\"$15000\"},{\"name\":\"M15Monastir3(ITF)\",\"season\":\"2020\",\"type\":\"singles\",\"surface\":\"hard\",\"prize\":\"$15,000\"},{\"name\":\"Pensacola(ITF)\",\"season\":\"2018\",\"type\":\"singles\",\"surface\":\"clay\",\"prize\":\"$15,000\"}]}]}"
}
extension MockPlayerTennisNetwork:TennisplayersProtocol{
    static func fetchResult(complitionHandler: @escaping (Goallll.TennisPlayerRoot?) -> Void, Update: String) {
        let data = Data(playerResponse.utf8)
        do{
            let res = try JSONDecoder().decode(TennisPlayerRoot.self, from: data)
            complitionHandler(res)
        }catch let error{
            print(error.localizedDescription)
            complitionHandler(nil)
        }
    }
    
    
    
    
}

