//
//  CoreDataDb.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 07/05/2023.
//


import Foundation
import CoreData
import UIKit

class CoreDataDb{
    static let obj=CoreDataDb()
    var context: NSManagedObjectContext!
//    var playerObj:[NSManagedObject]!
//    var allPlayerObj:[NSManagedObject]!
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    func insertPlayerDataUsingCoreData(league:LeagueResultCoreData){
        
        let storedLeague = StoredLeague(context: context)
        storedLeague.country_logo = league.country_logo
        storedLeague.league_logo = league.league_logo
        storedLeague.country_name = league.country_name
        storedLeague.league_name = league.league_name
        storedLeague.leagueKey = Int64(league.league_key ?? 0)
        storedLeague.countryKey = Int64(league.country_key ?? 0)
        storedLeague.sport = league.sport
        
                
        do{
            try context?.save()
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    func fetchPlayerDataUsingCoreData() -> [LeagueResultCoreData]{
        var leagueResultList:[LeagueResultCoreData] = []
        let leagueList = try! context.fetch(StoredLeague.fetchRequest())
        leagueList.forEach { storedLeague in
            leagueResultList.append(LeagueResultCoreData(league_key: Int(storedLeague.leagueKey), league_name: storedLeague.league_name, country_key: Int(storedLeague.countryKey), country_name: storedLeague.country_name, league_logo: storedLeague.league_logo, country_logo: storedLeague.country_logo, sport: storedLeague.sport))
        }

        return leagueResultList
    }
    
    func deletePlayerDataUsingCoreData(leagueResult:LeagueResultCoreData,complitionHandler:@escaping([LeagueResultCoreData])->Void ){
        var request = StoredLeague.fetchRequest()
        request.predicate = NSPredicate(format: "leagueKey == %i", leagueResult.league_key ?? 0 )
        let leagueList = try! context.fetch(request)
        
        context.delete(leagueList[0])
        
        try! context.save()
       complitionHandler(fetchPlayerDataUsingCoreData())
        
    }
    func checkSavedOrNot(leagueKey:Int?) -> Bool {
        let request = StoredLeague.fetchRequest()
        request.predicate = NSPredicate(format: "leagueKey == %i", leagueKey ?? 0)
        let leagueList = try! context.fetch(request)
        if(leagueList.count == 0){
            return false
        }
        return true
    }
    
}
