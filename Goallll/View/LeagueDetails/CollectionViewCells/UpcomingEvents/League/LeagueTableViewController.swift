//
//  LeagueTableViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 04/05/2023.
//

import UIKit
import Kingfisher
import Reachability

class LeagueTableViewController: UITableViewController {
    var reachability = try! Reachability()
    var league:[LeagueResult]=[]
    var sport:String!
    
       override func viewDidLoad() {
        super.viewDidLoad()
           title="League"

    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
       do{
         try reachability.startNotifier()
       }catch{
         print("could not start reachability notifier")
       }
   
        Network.fetchResult(complitionHandler: {(res) in
            DispatchQueue.main.async {
                
                self.league = res!.result
                self.tableView.reloadData()
            }
        }, Update: sport+"/?met=Leagues")
        
    }
    @objc func reachabilityChanged(note: Notification) {
       //reachability = note.object as! Reachability
    }
    override func viewDidDisappear(_ animated: Bool) {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
               
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return league.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueTableViewCell", for: indexPath) as! LeagueTableViewCell
        
      
        cell.league_label!.text =  league[indexPath.row].league_name
        
        
        if (sport == "cricket"){
            cell.country_name!.text=""
            cell.league_img?.kf.setImage(with: URL(string: league[indexPath.row].league_logo ?? "cricketPlayer"), placeholder: UIImage(named: "cricketPlayer"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        else if(sport == "basketball"){
            cell.league_img?.kf.setImage(with: URL(string: league[indexPath.row].league_logo ?? "basketball"), placeholder: UIImage(named: "basketball"), options: nil, progressBlock: nil, completionHandler: nil)
            cell.country_name!.text=league[indexPath.row].country_name
        }
        else if(sport == "tennis"){
            cell.league_img?.kf.setImage(with: URL(string: league[indexPath.row].league_logo ?? "tennis"), placeholder: UIImage(named: "tennis"), options: nil, progressBlock: nil, completionHandler: nil)
            cell.country_name!.text=league[indexPath.row].country_name
        }
        
        else
        { cell.country_name!.text=league[indexPath.row].country_name
            cell.league_img?.kf.setImage(with: URL(string: league[indexPath.row].league_logo ?? "logo 2"), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (reachability.connection != .unavailable){
            let details=self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
            details.legueId = league[indexPath.row].league_key
            details.sport = sport
            details.league = league[indexPath.row]
            self.navigationController?.pushViewController(details, animated: true)
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
