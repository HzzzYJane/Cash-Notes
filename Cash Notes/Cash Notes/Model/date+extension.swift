//
//  Calendar.swift
//  Cash Notes
//
//  Created by hanzheyu on 3/9/21.
//
// Extension for date and Calendar

import Foundation

extension Calendar {

    static var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -10, to: Date())!
        let max = Calendar.current.date(byAdding: .month, value: 1, to: Date())!
        return min...max
    }
}

extension Date {
    var year: Int { Calendar.current.component(.year, from: self) }
    var month: Int { Calendar.current.component(.month, from: self) }
    
    var displayYearFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter.string(from: self)
    }
    
    var displayDayFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, y"
        return formatter.string(from: self)
    }
    
    var displayMonthFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM y"
        return formatter.string(from: self)
    }

}

