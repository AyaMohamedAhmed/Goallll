//
//  SportsCollectionViewCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 01/05/2023.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var SportsLabel: UILabel!
    @IBOutlet weak var SportsImg: UIImageView!
    
    func setup(sport:Sports){
        SportsImg.image=UIImage(named: sport.img)
        SportsLabel.text=sport.title
    }
}
