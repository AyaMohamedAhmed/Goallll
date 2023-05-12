//
//  UPComing.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 05/05/2023.
//

import Foundation


struct Root:Decodable{
    let success: Int
    let result: [UpComing]
}


struct UpComing:Decodable{
    let event_key: Int?
    let event_date, event_time, event_home_team: String?
    let home_team_key: Int?
    let event_away_team: String?
    let away_team_key: Int?
    let event_halftime_result: String?
    let event_final_result: EventFinalResult?
    let event_ft_result, event_penalty_result: String?
    let event_status: EventStatus?
    let country_name, league_name: String?
    let league_key: Int?
    let league_round, league_season, event_live, event_stadium: String?
    let event_referee: String?
    let home_team_logo, away_team_logo: String?
    let event_country_key: Int?
    let league_logo, country_logo: String?
    let event_home_formation, event_away_formation: String?
    let fk_stage_key: Int?
    let stage_name: String?
    let league_group: NSNull?
    let goalscorers, substitutes, cards: [Any?]?
    let lineups: Lineups?
    let statistics: [Any?]?
}

enum EventFinalResult{
    case empty
}

enum EventStatus {
    case cancelled
    case empty
    case postponed
}

// MARK: - Lineups
struct Lineups:Decodable {
    let home_team, away_team: Team
}

// MARK: - Team
struct Team:Decodable {
    let starting_lineups, substitutes, coaches, missingPlayers: [Any?]
}
