//
//  ScheduleView.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 15/05/2023.
//

import SwiftUI

struct ScheduleView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = ScheduleViewModel()

    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(viewModel.sortedScheduleByDate, id: \.id) { schedule in
                BaseRow(schedule: schedule)
            }
            .navigationViewStyle(text: .schedule)
            .onAppear {
                viewModel.startFetching(withInterval: 30, repeats: true)
                viewModel.fetchSchedule()
            }
            .onDisappear {
                viewModel.stopFetching()
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
