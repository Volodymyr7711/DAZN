//
//  BaseTabItemView.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import SwiftUI

enum TabIcon {
    /// shows event icon
    case event
    /// shows schedule icon
    case schedule
    
    var icon: String {
        switch self {
        case .event:
            return "sportscourt.circle"
        case .schedule:
            return "list.clipboard"
        }
    }
    
    var description: String {
        switch self {
        case .event:
            return "Events"
        case .schedule:
            return "Schedule"
        }
    }
}

struct BaseTabItemView<Content: View>: View {
    // MARK: - PROPERTIES
    let icon: TabIcon
    let content: Content

    // MARK: - INITIALIZER
    init(icon: TabIcon, @ViewBuilder content: () -> Content) {
        self.icon = icon
        self.content = content()
    }

    // MARK: - BODY
    var body: some View {
        content
            .tabItem {
                Image(systemName: icon.icon)
                Text(icon.description)
            }
    }
}

struct BaseTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        BaseTabItemView(
            icon: .event,
            content: {}
        )
        .previewLayout(.sizeThatFits)
        .padding(40)
    }
}
