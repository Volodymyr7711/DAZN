//
//  NetworkService.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 16/05/2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getResponse<T: Codable>(_ type: T.Type, urlString : Endpoint, completion: @escaping (Result<T, Error>)->Void)
}

class NetworkService: NetworkServiceProtocol {
    func getResponse<T: Codable>(_ type: T.Type, urlString : Endpoint, completion: @escaping (Result<T, Error>)->Void) {
        URLSession.shared.decode(
            type,
            urlString: urlString,
            completion: completion
        )
    }
}
