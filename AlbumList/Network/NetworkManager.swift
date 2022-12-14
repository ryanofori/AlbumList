//
//  NetworkManager.swift
//  AlbumList
//
//  Created by Ryan Ofori on 8/12/22.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func getJSON<T:Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(.invalidURL))
        }
        var request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let session = URLSession(configuration: config)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil, let data = data else {
                completion(.failure(.unknownError))
                return
            }
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode(T.self, from: data)
            if decodedData == nil {
                completion(.failure(.decodingError))
            } else {
                completion(.success(decodedData!))
            }
            
        }
        task.resume()
    }
}
enum NetworkError: Error {
    case invalidURL
    case decodingError
    case unknownError
}
