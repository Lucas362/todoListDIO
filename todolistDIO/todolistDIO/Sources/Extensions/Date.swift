//
//  Date.swift
//  todolistDIO
//
//  Created by Lucas on 19/08/21.
//

import Foundation

extension Date {
    public func convertDateToString(date: Date, dateFormatter: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let myString = formatter.string(from: date)
        let yourDate = formatter.date(from: myString)
        
        formatter.dateFormat = dateFormatter ?? "yyyy-MM-dd'T'HH:mm:ss"
        return formatter.string(from: yourDate!)
    }
    
    public func convertStringToDate(dateString: String, dateFormatter: String?) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter ?? "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter.date(from: dateString) ?? nil
    }
}
