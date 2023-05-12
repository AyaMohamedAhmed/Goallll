//
//  PlayerNetwork.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation
import Foundation
import XCTest
@testable import Goallll

final class PlayerTest: XCTestCase{
    
    let playerNetworkService:playersProtocol = PlayerNetwork()
    
    func testDataFromAPI(){
        let expectation = expectation(description: "Waiting data from API")
        PlayerNetwork.fetchResult(complitionHandler: {(data) in
            guard let data = data else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count,0,"API Failed To Return Data")
            expectation.fulfill()
        }
        , Update: "football/?&met=Teams&teamId=96")
        
        waitForExpectations(timeout: 5)
        
        
    }
    
}
