//
//  PlayerNetworkTest.swift
//  GoallllTests
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//

import Foundation
import XCTest
@testable import Goallll

final class TennisPlayerNetworkTests:XCTestCase{
    static let tennisPlayerNetwork = MockPlayerTennisNetwork()
    
    func testTennisPlayerData(){
        MockPlayerTennisNetwork.fetchResult(complitionHandler: {
            data in
            guard let data = data else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(data.result.count,0)
        }, Update: "tennis/?met=Players&playerId=3618")
        
        
    }
    
}

