//
//  TeamsCollectionViewCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 06/05/2023.
//

import UIKit
import Kingfisher
class TeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var teamsName: UILabel!
    @IBOutlet weak var TeamsImg: UIImageView!
    
    func SetUP(teams:Coming){
        teamsName.text=teams.event_away_team
        
        TeamsImg.kf.setImage(with: URL(string:teams.away_team_logo ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
                          
      
    }
    
}
