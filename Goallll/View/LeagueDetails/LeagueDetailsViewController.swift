//
//  LeagueDetailsViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 04/05/2023.
//

import UIKit
import Foundation
import Reachability

class LeagueDetailsViewController: UIViewController {

    @IBOutlet weak var TeamsCategory: UICollectionView!
    @IBOutlet weak var LatestResultsCategory: UICollectionView!
    @IBOutlet weak var upComingCategory: UICollectionView!
    @IBOutlet weak var Teams_lbl_hidden: UILabel!
    @IBOutlet weak var LatestResult_lbl_hidden: UILabel!
    @IBOutlet weak var UPComing_lbl_hidden: UILabel!
    
    
    var upComing:[Coming]=[]
    var latestResult:[Coming]=[]
    var teams:[Coming]=[]
    var sport:String!
    var startTime:String!
    var lastTime:String!
    var legueId:Int!
    var league:LeagueResult!
    var reachability = try! Reachability()

     
    func getDate(){
       let date = Date()
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US")
        startTime = dateFormatter.string(from: date)
        var dateComponent = DateComponents()
        dateComponent.day = 15
        let LastTimeDate = Calendar.current.date(byAdding: dateComponent, to: date)
        lastTime = dateFormatter.string(from: LastTimeDate!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        upComingCategory.collectionViewLayout=flowLayout
        
        let sflowLayout = UICollectionViewFlowLayout()
        sflowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        LatestResultsCategory.collectionViewLayout=sflowLayout
        
        let yflowLayout = UICollectionViewFlowLayout()
        yflowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        TeamsCategory.collectionViewLayout=yflowLayout

        title="League Details"
        getDate()
        registerCells()

       
        
    }
    private func registerCells(){
        upComingCategory.register(UINib(nibName: "UPComingEventsCell", bundle: nil), forCellWithReuseIdentifier: "UPComingEventsCell")
        
        LatestResultsCategory.register(UINib(nibName: "LatesetResultsCell", bundle: nil), forCellWithReuseIdentifier: "LatesetResultsCell")
       
        TeamsCategory.register(UINib(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.LatestResult_lbl_hidden.isHidden = true
        self.UPComing_lbl_hidden.isHidden = true
        self.Teams_lbl_hidden.isHidden = true
        if(self.league != nil){
            if(CoreDataDb.obj.checkSavedOrNot(leagueKey: self.league.league_key ?? 0)){
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(self.deleteFromFavourite))
            }
            else{
                navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart"), style: .plain, target: self, action: #selector(addToFavourite))
            }
        }
        
        UpComingNetwork.fetchResult(complitionHandler: {(res) in
            DispatchQueue.main.async {
                if(res != nil && res?.result.count != 0){
                    self.UPComing_lbl_hidden.isHidden = true
                    self.Teams_lbl_hidden .isHidden = true
                    self.upComing = res!.result
                    self.upComingCategory.reloadData()
                    self.teams=res!.result
                    self.TeamsCategory.reloadData()
                    
                }
                else{
                    self.upComingCategory.isHidden = true
                    self.TeamsCategory.isHidden = true
                    self.UPComing_lbl_hidden.isHidden = false
                    self.Teams_lbl_hidden.isHidden = false
                    
                }
               
                
            }
        }, Update: sport+"/?met=Fixtures", Duration:"&from="+startTime+"&to="+lastTime, legueId:"&leagueId="+String(legueId),type:sport)
        
        LatestNetwork.fetchResult(complitionHandler: {(res) in
            DispatchQueue.main.async {
                if(res != nil && res?.result.count != 0 ){
                    self.LatestResult_lbl_hidden.isHidden = true
                    self.latestResult = res!.result
                    self.LatestResultsCategory.reloadData()
                    
                }
                else {
                    self.LatestResultsCategory.isHidden = true
                    self.LatestResult_lbl_hidden.isHidden = false
                }
                
            }
        }, Update: sport+"/?met=Livescore",legueId:"&leagueId="+String(legueId),type:sport)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
        
    }
    @objc func addToFavourite(_ sender: Any) {
        
        let alert = UIAlertController(title: "Goallll", message: " Are you sure you want to add in favourite??", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default,handler: {  action in
            CoreDataDb.obj.insertPlayerDataUsingCoreData(league: LeagueResultCoreData(league_key: self.league.league_key, league_name: self.league.league_name, country_key: self.league.country_key, country_name: self.league.country_name, league_logo: self.league.league_logo, country_logo: self.league.country_logo, sport: self.sport))
            
            print("save in CoreDataDb")
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(self.deleteFromFavourite))
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        self.present(alert, animated: true)
        
    }
    
    @objc func deleteFromFavourite(_ sender: Any){
        let alert = UIAlertController(title: "Goallll", message: " Are you sure you want to delete from favourite??", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default,handler: { [self]  action in
            
            CoreDataDb.obj.deletePlayerDataUsingCoreData(leagueResult: LeagueResultCoreData(league_key: self.league.league_key, league_name: self.league.league_name, country_key: self.league.country_key, country_name: self.league.country_name, league_logo: self.league.league_logo, country_logo: self.league.country_logo, sport: self.sport),complitionHandler: { result in
                // self.league = result
            })
            
            print("delete from CoreDataDb")
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "suit.heart"), style: .plain, target: self, action: #selector(self.addToFavourite))
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        self.present(alert, animated: true)
        
    }
    @objc func reachabilityChanged(note: Notification) {
       //reachability = note.object as! Reachability
    }
    override func viewDidDisappear(_ animated: Bool) {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
        
    }

}
extension LeagueDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case upComingCategory:
            return upComing.count
        case LatestResultsCategory:
            return latestResult.count
        case TeamsCategory:
            return teams.count
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case upComingCategory:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UPComingEventsCell", for: indexPath) as! UPComingEventsCell
            cell.setUp(upComing: upComing[indexPath.row])
            return cell
            
        case LatestResultsCategory:
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "LatesetResultsCell", for: indexPath) as! LatesetResultsCell
            cell2.SetUP(latestResult:latestResult[indexPath.row])
            return cell2
            
        case TeamsCategory:
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
            cell3.SetUP(teams: teams[indexPath.row])
            return cell3
        default:
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case upComingCategory:
            return CGSize(width:upComingCategory.bounds.width - 5, height: (upComingCategory.bounds.height - 10))
        case LatestResultsCategory:
            return CGSize(width: (LatestResultsCategory.bounds.width - 25), height: (LatestResultsCategory.bounds.height-5))
            
        case TeamsCategory:
            return CGSize(width: (TeamsCategory.bounds.width)/2, height: (TeamsCategory.bounds.height-5))
        default:
            return CGSize(width: (collectionView.frame.width - 25), height: (collectionView.frame.height-20)/2)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (reachability.connection != .unavailable){
            if collectionView == TeamsCategory{
                let detail=self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
                detail.sport = sport
                detail.teamID = String(teams[indexPath.row].away_team_key)
                self.navigationController?.pushViewController(detail, animated: true)
                
            }
            else{}
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
