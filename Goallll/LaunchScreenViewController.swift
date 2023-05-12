//
//  LaunchScreenViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 11/05/2023.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    var animation:LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LottieAnimation()
        
    }
    
    func LottieAnimation(){
            animation = .init(name:"loading")
            animation.frame = view.bounds
            animation.contentMode = .scaleAspectFit
            animation.loopMode = .loop
            view.addSubview(animation)
            animation.play()
        }
}
    



