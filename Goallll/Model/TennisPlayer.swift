//
//  TennisPlayer.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 09/05/2023.
//

import Foundation

struct TennisPlayerRoot :Decodable{
    let success: Int
    let result: [TennisPlayer]
}

struct TennisPlayer:Decodable {
    let player_key: Int
    let player_name:String
    let player_country:String
    let player_bday: String
    let player_logo:String?
    
}


