//
//  EventViewModel.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import Foundation
import SwiftUI

class EventViewModel: BaseViewModel {
    // MARK: - PROPERTIES
    @Published var event: [BaseModel] = []
    @State private var errorMessage : String = ""

    var sortedEventByDate: [BaseModel] {
        event.sorted(by: { $0.date < $1.date })
    }

    func fetchEvents(networkService: NetworkServiceProtocol = NetworkService()) {
        networkService.getResponse(
            [BaseModel].self,
            urlString: .event) { result in
                switch result {
                case .success(let event):
                    DispatchQueue.main.async {
                        self.event = event
                    }

                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }
    
    func startFetching(withInterval: Double, repeats: Bool) {
        timer?.invalidate()

        timer = Timer.scheduledTimer(withTimeInterval: withInterval, repeats: repeats) { [weak self] _ in
            self?.fetchEvents()
        }

        fetchEvents()
    }
}
