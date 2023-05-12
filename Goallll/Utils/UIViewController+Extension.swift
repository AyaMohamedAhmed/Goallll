//
//  UIViewController+Extension.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//

import UIKit
import Foundation

extension UIViewController{
    static var identifier: String{
        return String(describing: self)
    }
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
