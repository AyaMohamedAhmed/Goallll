//
//  TeamDetailsViewController.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 06/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var playersCollectionView: UICollectionView!
    @IBOutlet weak var team_logo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var Player_lbl: UILabel!
    
    
    var teamID:String!
    var sport:String!
    var players:[Player]=[]
    var tennisPlayers:[TennisPlayer] = []
    var dataNotComing: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Team Details"
        
    
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        playersCollectionView.collectionViewLayout=flowLayout
        registerCells()
        
    }
    private func registerCells(){
        playersCollectionView.register(UINib(nibName: "PlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlayerCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if(sport != "tennis"){
            PlayerNetwork.fetchResult(complitionHandler: {(res) in
                DispatchQueue.main.async { [self] in
                    if(res != nil){
                        self.dataNotComing = false
                        res?.result.forEach{ (data) in
                            if(String(data.team_key) == self.teamID){
                                self.players = data.players
                                self.teamName.text = data.team_name
                                self.team_logo.kf.setImage(with: URL(string:res!.result[0].team_logo), placeholder: UIImage(named: "logo 2"), options: nil, progressBlock: nil, completionHandler: nil)
                                self.playersCollectionView.reloadData()
                            }
                        }
                        
                    }
                    else{
                        self.teamName.isHidden = true
                        self.Player_lbl.isHidden = true
                        let alert = UIAlertController(title: "Goallll", message: " Sorry!! Data isn't available", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default,handler:{ action in
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(alert, animated: true)
                        
                        

                    }
                }
            }, Update:sport+"/?&met=Teams&teamId="+teamID)
            
            
        }
        else{
            TennisPlayerNetwork.fetchResult(complitionHandler: {(res) in
                DispatchQueue.main.async {
                    if(res != nil){
                        self.dataNotComing = false
                        self.tennisPlayers = res?.result ?? []
                        res?.result.forEach{ (player) in
                            if(String(player.player_key) == self.teamID){
                                self.teamName.text = player.player_name
                                self.team_logo.kf.setImage(with: URL(string:res!.result[0].player_logo ?? ""), placeholder: UIImage(named: "tennis"), options: nil, progressBlock: nil, completionHandler: nil)
                                self.playersCollectionView.reloadData()
                            }
                        }
                        
                    }
        
                    else{
                        self.teamName.isHidden = true
                        self.Player_lbl.isHidden = true
                        let alert = UIAlertController(title: "Goallll", message: " Sorry!! Data isn't available", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default,handler:{ action in
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(alert, animated: true)
                        
                    }
                }
            }, Update:sport+"/?met=Players&playerId="+teamID)
            
        }
    }
}

extension TeamDetailsViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCollectionViewCell", for: indexPath) as! PlayerCollectionViewCell
        cell.SetUP(player:players[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (playersCollectionView.bounds.width - 25), height: (playersCollectionView.bounds.height-5)/4)
    }
    
}
