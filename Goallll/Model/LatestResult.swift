//
//  LatestResult.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 05/05/2023.
//

import Foundation

struct Welcome:Decodable{
    let success: Int
    let result: [LatestResult]
}

struct LatestResult:Decodable {
    let eventKey: Int
    let eventDate, eventTime, eventHomeTeam: String
    let homeTeamKey: Int
    let eventAwayTeam: String
    let awayTeamKey: Int
    let eventHalftimeResult, eventFinalResult, eventFtResult, eventPenaltyResult: String
    let eventStatus, countryName, leagueName: String
    let leagueKey: Int
    let leagueRound, leagueSeason, eventLive, eventStadium: String
    let eventReferee: String
    let homeTeamLogo, awayTeamLogo: String
    let eventCountryKey: Int
    let leagueLogo, countryLogo: String
    let eventHomeFormation, eventAwayFormation: String
    let fkStageKey: Int
    let stageName: String
    
}

