//
//  LeagueNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation

import XCTest
@testable import Goallll

final class LatestNetworkT: XCTestCase{
    
    let leagueNetwork:latestProtocol = LatestNetwork()
    
    func testDataFromAPI(){
        let expectation = expectation(description: "Waiting data from API")
        LatestNetwork.fetchResult(complitionHandler: {(data) in
            guard let data = data else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count,0,"API Failed To Return Data")
            expectation.fulfill()
        }
        , Update: "tennis/?met=Livescore", legueId: "&leagueId=2010",type: "tennis")
        
        waitForExpectations(timeout: 5)
        
        
    }
    
}
