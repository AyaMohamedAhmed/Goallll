//
//  LatesetResultsCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 05/05/2023.
//

import UIKit

class LatesetResultsCell: UICollectionViewCell {

    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var leftImg: UIImageView!
    
    func SetUP(latestResult:Coming){
        dateLabel.text=latestResult.event_date
        timeLabel.text=latestResult.event_time
        score.text=latestResult.event_final_result
        
        rightImg.kf.setImage(with: URL(string:latestResult.away_team_logo ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
                          
        leftImg.kf.setImage(with: URL(string:latestResult.league_logo ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
