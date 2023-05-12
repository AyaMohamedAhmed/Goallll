//
//  LatestNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class LatestNetworkTests:XCTestCase{
    static let latestNetwork = MockLatestNetwork()
    func testlatestData(){
        MockLatestNetwork.fetchResult(complitionHandler: {
            data in
            guard let data = data else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(data.result.count,0)
        }, Update: "tennis/?met=Livescore", legueId: "&leagueId=2010",type: "tennis")
        
        
    }
    
}
// Update: sport+"/?met=Livescore",legueId:"&leagueId="+String(legueId),type:sport

//https://apiv2.allsportsapi.com/tennis/?met=Livescore&APIkey=ffde25f8eab70696f7cc8842782728bea92d1e2041342717607b0782889d9308&leagueId=2010
