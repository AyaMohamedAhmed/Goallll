//
//  FavouriteTableViewCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 08/05/2023.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var FavouriteLbl: UILabel!
    @IBOutlet weak var FavouriteImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
