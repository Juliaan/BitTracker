//
//  DateHelper.swift
//  BitTracker
//
//  Created by Juliaan Evenwel on 2025/09/05.
//

import Foundation

class DateHelper {

    static let shared = DateHelper()
    private let formatter: DateFormatter

    /// Setup our formatters format on init
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
    }

    /// Format the date provided as "yyyy-MM-dd"
    func format(date: Date) -> String {
        return formatter.string(from: date)
    }

    /// Return a date (as a String), minus a given number of days
    func dateMinusDays(_ days: Int) -> String {
        let calendar = Calendar.current
        guard let date = calendar.date(byAdding: .day, value: -days, to: Date()) else {
            return "" // or handle error
        }
        return format(date: date)
    }

    /// Convert a Int timestamp (as received from API) to a formatted date string, formatted as "yyyy-MM-dd"
    func dateFromTimestamp(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        return format(date: date)
    }
    
}
