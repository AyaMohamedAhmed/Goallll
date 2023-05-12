//
//  OnboardingCollectionViewCell.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 01/05/2023.




import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(slide:OnboardingSlide){
        imgview.image=UIImage(named: slide.image)
         titleLabel.text=slide.title
        descriptionLabel.text=slide.description
    }
}
