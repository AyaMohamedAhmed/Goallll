//
//  GetDate.swift
//  Goallll
//
//  Created by Aya Mohamed Ahmed on 10/05/2023.
//

import Foundation
class GetDate{
    var startTime:String!
    var lastTime:String!
    
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
}
