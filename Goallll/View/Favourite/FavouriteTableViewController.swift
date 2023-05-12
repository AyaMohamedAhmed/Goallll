//
//  FavouriteTableViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//

import UIKit
import Kingfisher
import Reachability

class FavouriteTableViewController: UITableViewController {

    var league:[LeagueResultCoreData]=[]
    var football_league:[LeagueResultCoreData]=[]
    var basketball_league:[LeagueResultCoreData]=[]
    var tennis_league:[LeagueResultCoreData]=[]
    var cricket_league:[LeagueResultCoreData]=[]
    
    var reachability = try! Reachability()
    var imagePlaceHolder :String!
    var section = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        title="Favourite"
        

    }
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
        
        self.tabBarController?.tabBar.isHidden = false
        filterData()
    }
    
    @objc func reachabilityChanged(note: Notification) {
       //reachability = note.object as! Reachability
    }
    override func viewDidDisappear(_ animated: Bool) {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
        
        
    }
    func filterData(){
        league=CoreDataDb.obj.fetchPlayerDataUsingCoreData()
        football_league = []
        basketball_league = []
        tennis_league = []
        cricket_league = []
        
        for obj in league{
            if(obj.sport == "football"){
                football_league.append(obj)
            }
            else if(obj.sport == "basketball"){
                basketball_league.append(obj)
            }
            else if(obj.sport == "tennis"){
                tennis_league.append(obj)
            }
            else{
                cricket_league.append(obj)
            }
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return section
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch (section){
        case 0:
            return football_league.count
        case 1:
            return basketball_league.count
        case 2:
            return tennis_league.count
        case 3:
            return cricket_league.count
            
        default:
            return league.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        switch (indexPath.section){
        case 0:
            cell.FavouriteLbl?.text = football_league[indexPath.row].league_name
            imagePlaceHolder = "football"
            cell.FavouriteImg?.kf.setImage(with: URL(string:football_league[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: imagePlaceHolder), options: nil, progressBlock: nil, completionHandler: nil)
        case 1:
            cell.FavouriteLbl?.text = basketball_league[indexPath.row].league_name
            imagePlaceHolder = "basketball"
            cell.FavouriteImg?.kf.setImage(with: URL(string: basketball_league[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: imagePlaceHolder), options: nil, progressBlock: nil, completionHandler: nil)
        case 2:
            cell.FavouriteLbl?.text = tennis_league[indexPath.row].league_name
            imagePlaceHolder = "tennis"
            cell.FavouriteImg?.kf.setImage(with: URL(string: tennis_league[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: imagePlaceHolder), options: nil, progressBlock: nil, completionHandler: nil)
        case 3:
            cell.FavouriteLbl?.text = cricket_league[indexPath.row].league_name
            imagePlaceHolder = "cricketPlayer"
            cell.FavouriteImg?.kf.setImage(with: URL(string: cricket_league[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: imagePlaceHolder), options: nil, progressBlock: nil, completionHandler: nil)
        default:
            cell.FavouriteLbl?.text = league[indexPath.row].league_name
            imagePlaceHolder = "logo 2"
            cell.FavouriteImg?.kf.setImage(with: URL(string: league[indexPath.row].league_logo ?? ""), placeholder: UIImage(named: imagePlaceHolder), options: nil, progressBlock: nil, completionHandler: nil)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section){
        case 0:
            return "Football League"
        case 1:
            return "Basketball League"
        case 2:
            return "Tennis League"
        case 3:
            return "Cricket League"
        default:
            return "League"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Goallll", message: " Are you sure you want to delete ??", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default,handler: {  action in
            switch(indexPath.section){
            case 0:
                CoreDataDb.obj.deletePlayerDataUsingCoreData(leagueResult: LeagueResultCoreData(league_key: self.football_league[indexPath.row].league_key, league_name: self.football_league[indexPath.row].league_name, country_key: self.football_league[indexPath.row].country_key, country_name: self.football_league[indexPath.row].country_name, league_logo: self.football_league[indexPath.row].league_logo, country_logo: self.football_league[indexPath.row].country_logo, sport: self.football_league[indexPath.row].sport),complitionHandler: { result in
                    self.football_league = result
                    self.filterData()
                })
                    
                case 1:
                    CoreDataDb.obj.deletePlayerDataUsingCoreData(leagueResult: LeagueResultCoreData(league_key: self.basketball_league[indexPath.row].league_key, league_name: self.basketball_league[indexPath.row].league_name, country_key: self.basketball_league[indexPath.row].country_key, country_name: self.basketball_league[indexPath.row].country_name, league_logo: self.basketball_league[indexPath.row].league_logo, country_logo: self.basketball_league[indexPath.row].country_logo, sport: self.basketball_league[indexPath.row].sport),complitionHandler: { result in
                        self.basketball_league = result
                        self.filterData()
                    })
                        
            case 2:
                CoreDataDb.obj.deletePlayerDataUsingCoreData(leagueResult: LeagueResultCoreData(league_key: self.tennis_league[indexPath.row].league_key, league_name: self.tennis_league[indexPath.row].league_name, country_key: self.tennis_league[indexPath.row].country_key, country_name: self.tennis_league[indexPath.row].country_name, league_logo: self.tennis_league[indexPath.row].league_logo, country_logo: self.tennis_league[indexPath.row].country_logo, sport: self.tennis_league[indexPath.row].sport),complitionHandler: { result in
                    self.tennis_league = result
                    self.filterData()
                })
            case 3:
                CoreDataDb.obj.deletePlayerDataUsingCoreData(leagueResult: LeagueResultCoreData(league_key: self.cricket_league[indexPath.row].league_key, league_name: self.cricket_league[indexPath.row].league_name, country_key: self.cricket_league[indexPath.row].country_key, country_name: self.cricket_league[indexPath.row].country_name, league_logo: self.cricket_league[indexPath.row].league_logo, country_logo: self.cricket_league[indexPath.row].country_logo, sport: self.cricket_league[indexPath.row].sport),complitionHandler: { result in
                    self.cricket_league = result
                    self.filterData()
                })
            default:
                CoreDataDb.obj.deletePlayerDataUsingCoreData(leagueResult: LeagueResultCoreData(league_key: self.league[indexPath.row].league_key, league_name: self.league[indexPath.row].league_name, country_key: self.league[indexPath.row].country_key, country_name: self.league[indexPath.row].country_name, league_logo: self.league[indexPath.row].league_logo, country_logo: self.league[indexPath.row].country_logo, sport: self.league[indexPath.row].sport),complitionHandler: { result in
                    self.league = result
                    self.filterData()
                })
            }
                      
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        self.present(alert, animated: true)
   

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (reachability.connection != .unavailable){
            
            switch(indexPath.section){
            case 0:
                let details=self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
                details.legueId = self.football_league[indexPath.row].league_key
                details.sport = self.football_league[indexPath.row].sport
                //details.league = league[indexPath.row]
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(details, animated: true)
                
            case 1:
                let details=self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
                details.legueId = self.basketball_league[indexPath.row].league_key
                details.sport = self.basketball_league[indexPath.row].sport
                //details.league = league[indexPath.row]
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(details, animated: true)
            case 2:
                let details=self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
                details.legueId = self.tennis_league[indexPath.row].league_key
                details.sport = self.tennis_league[indexPath.row].sport
                //details.league = league[indexPath.row]
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(details, animated: true)
                
            case 3:
                let details=self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
                details.legueId = self.cricket_league[indexPath.row].league_key
                details.sport = self.cricket_league[indexPath.row].sport
                //details.league = league[indexPath.row]
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(details, animated: true)
                
            default:
                let details=self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
                details.legueId = self.league[indexPath.row].league_key
                details.sport = self.league[indexPath.row].sport
                //details.league = league[indexPath.row]
                self.tabBarController?.tabBar.isHidden = true
                self.navigationController?.pushViewController(details, animated: true)
                
            }
            
            
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
