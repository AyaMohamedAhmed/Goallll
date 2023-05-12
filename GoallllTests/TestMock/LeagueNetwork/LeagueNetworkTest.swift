//
//  LeagueNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class LeagueNetworkTests:XCTestCase{
    static let leagueNetwork = MockNetworkService()
    
    func testLeagueData(){
        MockNetworkService.fetchResult(complitionHandler: {
            data in
            guard let data = data else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(data.result.count,0)
        }, Update: "football/?met=Leagues")
        
        
    }
    
}
