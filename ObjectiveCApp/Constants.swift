//
//  Constants.swift
//  ObjectiveCApp
//
//  Created by Michael Metzger  on 10/23/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation

 let dateFormatter = DateFormatter()

let users = "users"

let customers = "customers"

let userIDType = "user_type"

//Developers



let DEVELOPERTYPE = "developerType"
let FREELANCER = "freelancer"
let COMPANY = "company"

let developer = "developers"


var currentUserDevType: String?



extension Date {
    
    func westernTime() ->String{
        
        let date = self.currentTimeInt()
    
        return "\(date.month)/ \(date.day)/ \(date.year)"
    }
    
    
    
    func currentTimeInt() ->(hours: Int, minutes: Int, seconds: Int, month: Int, day: Int, year: Int, weekday: Int, monthString: String, weekofmonth: Int){
        
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.day , .month , .year, .hour, .minute, .second, .weekday, .weekOfMonth], from: self)
        
        let year =  components.year
        let month = components.month
        let months = dateFormatter.shortMonthSymbols
        
        let monthSymbol = (months?[month!-1])! as String
        
        let day = components.day
        let hours = components.hour
        let minutes = components.minute
        let seconds = components.second
        let weekday = components.weekday
        let weekofMonth = components.weekOfMonth
        
        return (hours!, minutes!, seconds!, month!, day!, year!, weekday!, monthSymbol, weekofMonth!)
    }
    
    
    
    func dayAdderandSubtractor(_ daystoModify: Int) -> Date {
        
        
        return  Calendar.current.date(byAdding: .day, value: daystoModify, to: self)!
        
        
    }

    
}
