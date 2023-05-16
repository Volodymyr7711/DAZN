//
//  EventViewModifier.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation
import SwiftUI

class BaseNavigationViewModifier {
    enum NavigationText {
        case events
        case schedule
        
        var description: String {
            switch self {
            case .events:
                return Strings.events
            case .schedule:
                return Strings.schedule
            }
        }
        
        var accessibilityIdentifier: String {
            switch self {
            case .events:
                return "EventsListIdentifier"
            
            case .schedule:
                return "ScheduleListIdentifier"
            }
        }
    }

    struct NavigationViewModifier: ViewModifier {
        // MARK: - PROPERTIES
        let text: NavigationText

        // MARK: - BODY
        func body(content: Content) -> some View {
            content
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                .navigationBarTitle(text.description, displayMode: .automatic)
                .accessibility(identifier: text.accessibilityIdentifier)
        }
    }
}
