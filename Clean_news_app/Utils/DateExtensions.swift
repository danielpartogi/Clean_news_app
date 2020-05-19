//
//  DateExtensions.swift
//  Clean_news_app
//
//  Created by daniel on 18/05/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import Foundation

extension Date {
    
    func toStringFormat(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        formatter.locale = Locale(identifier: "id_ID")
        return formatter.string(from: self)
    }
    
    func addMonth(n: Int) -> Date {
       let cal = NSCalendar.current
       return cal.date(byAdding: .month, value: n, to: self)!
     }
}

