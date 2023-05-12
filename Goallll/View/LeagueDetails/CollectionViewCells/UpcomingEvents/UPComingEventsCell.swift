//
//  UPComingEventsCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 05/05/2023.
//

import UIKit
import Kingfisher

class UPComingEventsCell: UICollectionViewCell {

//    static let identifier = String(describing: UPComingEventsCell.self)
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var rightImgView: UIImageView!
    @IBOutlet weak var leftImgView: UIImageView!
    
    func setUp(upComing:Coming){
        Date.text=upComing.event_date
        time.text=upComing.event_time
        rightImgView.kf.setImage(with: URL(string:upComing.away_team_logo ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
                     
        leftImgView.kf.setImage(with: URL(string:upComing.home_team_logo ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
    }
}
