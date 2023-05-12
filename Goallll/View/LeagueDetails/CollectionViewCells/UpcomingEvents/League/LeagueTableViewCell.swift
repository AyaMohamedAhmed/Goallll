//
//  LeagueTableViewCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 04/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var country_name: UILabel!
    @IBOutlet weak var league_label: UILabel!
    @IBOutlet weak var league_img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
