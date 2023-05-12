//
//  UserDefault+Extension.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//

import Foundation

extension UserDefaults{
    private enum UserDefaultKey: String{
        case onboarded
    }
    
    var onboarded: Bool {
        get{
            bool(forKey: UserDefaultKey.onboarded.rawValue)
        }
        set{
            setValue(newValue, forKey: UserDefaultKey.onboarded.rawValue)
        }
    }
}
