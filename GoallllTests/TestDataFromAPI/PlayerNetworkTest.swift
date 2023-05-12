//
//  PlayerNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class PlayerNetworkTest: XCTestCase{
    let playerNetwork:TennisplayersProtocol = TennisPlayerNetwork() as! TennisplayersProtocol
    
    func testPlayerDataFromAPI(){
        let expectation = expectation(description: "Waiting data from API")
    
        TennisPlayerNetwork.fetchResult(complitionHandler: {(data) in
            guard let data = data else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count,0,"API Failed To Return Data")
            expectation.fulfill()
        }
        , Update: "tennis/?met=Players&playerId=3618")
        
        waitForExpectations(timeout: 5)
        
        
    }
    
}

