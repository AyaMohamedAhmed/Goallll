//
//  PlayerCollectionViewCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 06/05/2023.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    var imagePlaceolder:String!
    @IBOutlet weak var playerImg: UIImageView!
    
    @IBOutlet weak var PlayerNumber: UILabel!
    @IBOutlet weak var PlayerName: UILabel!
    
    func SetUP(player:Player){
        
       
        PlayerName.text=player.player_name
        PlayerNumber.text=player.player_number
        playerImg.kf.setImage(with: URL(string:player.player_image ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
                          
      
    }
    
}
