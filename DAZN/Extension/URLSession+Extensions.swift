//
//  URLSession+Extensions.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 12/05/2023.
//

import Foundation

public enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

extension URLSession {
    func decode <T: Codable> (
        _ type : T.Type,
        urlString : Endpoint,
        completion: @escaping (Result<T, Error>)->Void)  {
        
            guard let url = URL(string: urlString.endpoint) else { return }
        
            let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Failed to load \(url)")
            }
            
            if let error = error {
                completion(.failure(error))
            }
            else {
                do {
                    let decoder = JSONDecoder()
                        let results = try decoder.decode(type, from: data)
                        completion(.success(results))
                }
                catch {
                    completion(.failure(error))
                }
            }
        })
        task.resume()
    }
}
