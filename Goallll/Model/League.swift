//
//  League.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 01/05/2023.
//

import Foundation


struct League:Decodable {
    let success: Int
    let result: [LeagueResult]
}

struct LeagueResult:Decodable {
    let league_key: Int?
    let league_name: String?
    let country_key: Int?
    let country_name: String?
    let league_logo:String?
    let country_logo: String?
}
