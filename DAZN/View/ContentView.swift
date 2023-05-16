//
//  ContentView.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            BaseTabItemView(icon: .event) {
                EventView()
            }

            BaseTabItemView(icon: .schedule) {
                ScheduleView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
