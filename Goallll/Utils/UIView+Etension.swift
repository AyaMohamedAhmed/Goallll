//
//  UIView+Etension.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 01/05/2023.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable var cornerRadius:CGFloat{
        get{return cornerRadius}
        set{ self.layer.cornerRadius=newValue}
    }
}



