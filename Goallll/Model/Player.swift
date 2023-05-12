//
//  Player.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 06/05/2023.
//

import Foundation

struct PlayerRoot:Decodable {
    let success: Int
    let result: [Response]
}

struct Response:Decodable {
    let team_key: Int
    let team_name: String
    let team_logo: String
    let players: [Player]
}

struct Player:Decodable {
    let player_key: Int
    let player_name, player_number: String
    let player_age, player_match_played, player_goals, player_yellow_cards: String
    let player_red_cards: String
   let player_image: String!
}

