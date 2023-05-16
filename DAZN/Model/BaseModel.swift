//
//  EventModel.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import Foundation

enum Endpoint {
    /// Event Endpoint
    case event
    /// Schedule Endpoint
    case schedule
    
    var endpoint: String {
        switch self {
        case .event:
            return "https://us-central1-dazn-sandbox.cloudfunctions.net/getEvents"
        case .schedule:
            return "https://us-central1-dazn-sandbox.cloudfunctions.net/getSchedule"
        }
    }
}

struct BaseModel: Codable, Identifiable, Equatable {
    /// Presents unique Identifier
    var id: String
    /// Presents title
    var title: String
    /// Presents subtitle
    var subtitle: String
    /// Presents date
    var date: String
    /// Presents image
    var imageUrl: String
    /// Presents videUrl
    var videoUrl: String
}

struct ScheduleModel: Codable, Identifiable {
    /// Presents unique Identifier
    var id: String
    /// Presents title
    var title: String
    /// Presents subtitle
    var subtitle: String
    /// Presents date
    var date: String
    /// Presents image
    var imageUrl: String
}
