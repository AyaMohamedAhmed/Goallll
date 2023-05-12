//
//  Coming.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 05/05/2023.
//

import Foundation

//Root

struct Roots:Decodable{
    let success: Int
    let result: [Coming]
}

struct Coming:Decodable{
    let event_date, event_time: String
    let event_away_team: String
    let event_final_result: String
    let  league_name: String
    let home_team_logo, away_team_logo: String
    let league_logo : String
    let away_team_key :Int
    
}

