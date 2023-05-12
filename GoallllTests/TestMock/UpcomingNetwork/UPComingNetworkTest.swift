//
//  UPComingNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class UPComingNetworkTests:XCTestCase{
    static let upcomingNetwork = MockUpcomingNetworkService()
    
    func testUpcomingData(){
        MockUpcomingNetworkService.fetchResult(complitionHandler: {
            data in
            guard let data = data else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(data.result.count,0)
        }, Update: "football/?met=Fixtures",Duration: "&from=2023-05-05&to=2023-05-07" ,legueId: "&leagueId=152", type: "football")
    }
    
}

