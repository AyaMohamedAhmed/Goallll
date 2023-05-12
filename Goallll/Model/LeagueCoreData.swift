//
//  LeagueCoreData.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 08/05/2023.
//

import Foundation
struct LeagueCoreData:Decodable {
    let success: Int
    let result: [LeagueResult]
}

struct LeagueResultCoreData:Decodable {
    let league_key: Int?
    let league_name: String?
    let country_key: Int?
    let country_name: String?
    let league_logo:String?
    let country_logo: String?
    let sport:String?
}
