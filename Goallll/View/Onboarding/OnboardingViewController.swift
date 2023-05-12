//
//  OnboardingViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 01/05/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var nextbtnOutlet: UIButton!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var isFirstScroll = true
    var  currentPage = 0 {
        didSet{
            //pageControll.currentPage = currentPage
            
            if currentPage == slides.count - 1{
                nextbtnOutlet.setTitle("Get Started", for: .normal)
            }
            else{
                nextbtnOutlet.setTitle("Next", for: .normal)
            }
        }
    }
    let slides:[OnboardingSlide]=[
        OnboardingSlide(title: "Football", description: "Football is a game about feelings and intelligence",image:"football"),
    OnboardingSlide(title: "Basketball", description: "Basketball is such an escape from a lot of things",image:"basketball"),
    OnboardingSlide(title: "Tennis", description: "Every good tennis player has to have a short memory", image:"tennis")
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
      
    }
    

    @IBAction func nextBtn(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.onboarded = true
            present(controller, animated: true , completion:nil )
        }else{
            currentPage = currentPage + 1
            let indexpath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            collectionView.reloadData()
            pageControll.currentPage = currentPage

        }
    
        
    }
    

}

extension OnboardingViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide: slides[currentPage])
        //currentPage  = indexPath.row
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage=Int(scrollView.contentOffset.x / width)
        pageControll.currentPage = currentPage
    }
    
}
