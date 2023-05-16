//
//  BaseViewModel.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation
import Combine

protocol BaseViewModelProtocol: ObservableObject {
    var timer: Timer? { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    var timer: Timer?
    private var cancellables: Set<AnyCancellable> = []
    
    func stopFetching() {
        timer?.invalidate()
    }
}
