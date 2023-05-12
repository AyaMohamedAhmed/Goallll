//
//  HomeViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 01/05/2023.
//

import UIKit
import Reachability

class HomeViewController: UIViewController {
    var reachability = try! Reachability()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout=UICollectionViewFlowLayout()
        title="Goallll"
        
    }
    
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        if #available(iOS 13.0, *){
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn{
                appDelegate?.overrideUserInterfaceStyle = .dark
                self.navigationController?.navigationBar.tintColor = .white
                return
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            self.navigationController?.navigationBar.tintColor = .black
            return
        }
        else{
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
       do{
         try reachability.startNotifier()
       }catch{
         print("could not start reachability notifier")
       }
   
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @objc func reachabilityChanged(note: Notification) {
       //reachability = note.object as! Reachability
    }
    override func viewDidDisappear(_ animated: Bool) {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
        
        
    }
}
    extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return sports.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportsCollectionViewCell", for: indexPath) as! SportsCollectionViewCell
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius=25
            cell.setup(sport: sports[indexPath.row])
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.frame.width-15)/2, height: (collectionView.frame.height-120)/2)

        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            if (reachability.connection != .unavailable){
                
                print(sports[indexPath.row].title)
                var indexPathTitle:String = ""
                switch indexPath.row{
                case 0:
                    indexPathTitle="football"
                case 1:
                    indexPathTitle="tennis"
                case 2:
                    indexPathTitle="basketball"
                case 3:
                    indexPathTitle="cricket"
                    
                default:
                    indexPathTitle=""
                }
                
                let LeagueTable=self.storyboard?.instantiateViewController(withIdentifier: "LeagueTableViewController") as! LeagueTableViewController
                LeagueTable.sport = indexPathTitle
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(LeagueTable, animated: true)
              
            }
            else{
                let alert = UIAlertController(title: "Goallll", message: " Sorry!! you are offline", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
               
                do {
                    try reachability.startNotifier()
                } catch {
                    print("Unable to start notifier")
                }
            }
          
        }
    }




