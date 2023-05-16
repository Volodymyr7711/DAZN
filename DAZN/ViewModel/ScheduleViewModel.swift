//
//  ScheduleViewModel.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import Foundation
import SwiftUI

class ScheduleViewModel: BaseViewModel {
    // MARK: - PROPERTIES
    @Published var schedule: [ScheduleModel] = []
    @State private var errorMessage : String = ""
    
    var sortedScheduleByDate: [ScheduleModel] {
        schedule.sorted(by: { $0.date < $1.date })
    }

    func fetchSchedule(networkService: NetworkServiceProtocol = NetworkService()) {
        networkService.getResponse(
            [ScheduleModel].self,
            urlString: .schedule) { result in
                switch result {
                case .success(let schedule):
                    DispatchQueue.main.async {
                        self.schedule = schedule
                    }

                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }
    
    func startFetching(withInterval: Double, repeats: Bool) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: withInterval, repeats: repeats) { [weak self] _ in
            self?.fetchSchedule()
        }

        fetchSchedule()
    }
}
