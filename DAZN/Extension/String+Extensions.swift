//
//  String+Extensions.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation

extension String {
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = formatter.date(from: self) {
            let displayFormatter = DateFormatter()
            
            let today = Calendar.current.startOfDay(for: Date())
            
            // Check if the date is today
            if Calendar.current.isDateInToday(date) {
                displayFormatter.dateFormat = "'Today,' HH:mm"
                return displayFormatter.string(from: date)
            }
            
            // Check if the date is yesterday
            if Calendar.current.isDateInYesterday(date) {
                displayFormatter.dateFormat = "'Yesterday,' HH:mm"
                return displayFormatter.string(from: date)
            }
            
            // Check if the date is tomorrow
            if Calendar.current.isDateInTomorrow(date) {
                displayFormatter.dateFormat = "'Tomorrow,' HH:mm"
                return displayFormatter.string(from: date)
            }
            
            // Check if the date is within the next two days
            if let nextTwoDays = Calendar.current.date(byAdding: .day, value: 2, to: today),
               date <= nextTwoDays {
                displayFormatter.dateFormat = "'In two days'"
                return displayFormatter.string(from: date)
            }
            
            // Check if the date is within the next three days
            if let nextThreeDays = Calendar.current.date(byAdding: .day, value: 3, to: today),
               date <= nextThreeDays {
                displayFormatter.dateFormat = "'In three days'"
                return displayFormatter.string(from: date)
            }
            
            
            // Format for other days
            displayFormatter.dateFormat = "EEEE, HH:mm"
            return displayFormatter.string(from: date)
        }
        
        return "Invalid date string"
    }
}
