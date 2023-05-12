//
//  LeaguesDetail.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//


import Foundation


struct FootballRoot:Decodable{
    let success: Int?
    let result: [Football]?
}

struct Football:Decodable{
    let event_key: Int?
    let event_date: String?
    let event_time: String?
    let event_home_team: String?
    let home_team_key: Int?
    let event_away_team: String?
    let away_team_key: Int?
    let event_halftime_result: String?
    let event_final_result: String?
    let country_name, league_name: String?
    let league_key: Int?
    let event_stadium: String?
    let home_team_logo, away_team_logo: String?
    let league_logo, country_logo: String?
}


struct BasketballRoot:Decodable{
    let success: Int?
    let result: [Basketball]?
}

struct Basketball:Decodable{
    let event_key: Int?
    let event_date: String?
    let event_time: String?
    let event_home_team: String?
    let home_team_key: Int?
    let event_away_team: String?
    let away_team_key: Int?
    let event_halftime_result: String?
    let event_final_result: String?
    let country_name, league_name: String?
    let league_key: Int?
    let event_stadium: String?
    let event_home_team_logo, event_away_team_logo: String?
    let league_logo, country_logo: String?
}




struct TennisRoot:Decodable {
    let success: Int?
    let result: [Tennis]?
}


struct Tennis: Decodable {
    let event_key: Int?
    let event_date: String?
    let event_time: String?
    let event_first_player: String?
    let first_player_key: Int?
    let event_second_player: String?
    let second_player_key: Int?
    let country_name: String?
    let league_name: String?
    let league_key: Int?
    let event_first_player_logo: String?
    let event_second_player_logo: String?
    let event_final_result:String?
}


struct CricketRoot:Decodable {
    let success: Int?
    let result: [Cricket]?
}
struct Cricket: Decodable {
    let event_key: Int?
    let event_date_start: String?
    let event_date_stop: String?
    let event_time: String?
    let event_home_team: String?
    let home_team_key: Int?
    let event_away_team: String?
    let away_team_key: Int?
    let event_home_final_result: String?
    let event_away_final_result: String?
    let event_status_info: String?
    let country_name: String?
    let league_name: String?
    let league_key: Int?
    let event_stadium: String?
    let event_home_team_logo: String?
    let event_away_team_logo: String?
}



