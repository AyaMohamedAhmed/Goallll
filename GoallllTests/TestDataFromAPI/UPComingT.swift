//
//  UPComingT.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class UPComingT: XCTestCase{
    
    let upComingNetwork:upComingProtocol = UpComingNetwork()
    
    func testDataFromAPI(){
        let expectation = expectation(description: "Waiting data from API")
        UpComingNetwork.fetchResult(complitionHandler: {(data) in
            guard let data = data else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(data.result.count,0,"API Failed To Return Data")
            expectation.fulfill()
        }
        , Update: "football/?met=Fixtures",Duration: "&from=2023-05-05&to=2023-05-07" ,legueId: "&leagueId=152", type: "football")
        
        waitForExpectations(timeout: 5)
        
        
    }
    
}
