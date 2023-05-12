//
//  NetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class NetworkTest: XCTestCase{
    let networkService:networkProtocol = Network()
    
    func testDataFromAPI(){
        let expectation = expectation(description: "Waiting data from API")
        Network.fetchResult(complitionHandler: {(data) in
            guard let data = data else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count,0,"API Failed To Return Data")
            expectation.fulfill()
        }
        , Update: "football/?met=Leagues")
        
        waitForExpectations(timeout: 5)
        
        
    }
    
}
