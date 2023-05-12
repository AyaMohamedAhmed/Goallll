//
//  ConverterPojo.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//

import Foundation

class ConverterPojo{
    
    static func convertFixtureFootball(fixture:FootballRoot) -> Roots {
        var footballList:[Coming] = []
        fixture.result?.forEach({ football in
            footballList.append(Coming(event_date: football.event_date ?? "--/--/--", event_time: football.event_time ?? "__:__:__", event_away_team: football.event_away_team ?? "", event_final_result: football.event_final_result ?? "", league_name: football.league_name ?? "", home_team_logo: football.home_team_logo ?? "", away_team_logo: football.away_team_logo ?? "", league_logo: football.league_logo ?? "", away_team_key: football.away_team_key ?? 0))
        })
        return Roots(success: 1, result: footballList)
    }
    static func convertFixtureBasketball(fixture:BasketballRoot) -> Roots {
        var basketballList:[Coming] = []
        fixture.result?.forEach({ basketball in
            basketballList.append(Coming(event_date: basketball.event_date ?? "--/--/--", event_time: basketball.event_time ?? "__:__:__", event_away_team: basketball.event_away_team ?? "", event_final_result: basketball.event_final_result ?? "", league_name: basketball.league_name ?? "", home_team_logo: basketball.event_home_team_logo ?? "", away_team_logo: basketball.event_away_team_logo ?? "", league_logo: basketball.league_logo ?? "", away_team_key: basketball.away_team_key ?? 0))
        })
        return Roots(success: 1, result: basketballList)
    }
    static func convertFixtureTennis(fixture:TennisRoot) -> Roots {
           var tennisList:[Coming] = []
           fixture.result?.forEach({ tennis in
               tennisList.append(Coming(event_date: tennis.event_date ?? "--/--/--", event_time: tennis.event_time ?? "__:__:__", event_away_team: tennis.event_second_player ?? "", event_final_result: tennis.event_final_result ?? "", league_name: tennis.league_name ?? "", home_team_logo: tennis.event_first_player_logo ?? "", away_team_logo: tennis.event_second_player_logo ?? "", league_logo: tennis.event_first_player_logo ?? "", away_team_key: tennis.second_player_key ?? 0))
           })
           return Roots(success: 1, result: tennisList)
       }
    
    static func convertFixtureCricket(fixture:CricketRoot) -> Roots {
           var cricketList:[Coming] = []
           fixture.result?.forEach({ cricket in
               cricketList.append(Coming(event_date: cricket.event_date_start ?? "--/--/--", event_time: cricket.event_time ?? "__:__:__", event_away_team: cricket.event_away_team ?? "", event_final_result: cricket.event_home_final_result ?? "", league_name: cricket.league_name ?? "", home_team_logo: cricket.event_home_team_logo ?? "", away_team_logo: cricket.event_away_team_logo ?? "", league_logo: cricket.event_home_team_logo ?? "", away_team_key: cricket.away_team_key ?? 0))
           })
           return Roots(success: 1, result: cricketList)
       }
    
}
