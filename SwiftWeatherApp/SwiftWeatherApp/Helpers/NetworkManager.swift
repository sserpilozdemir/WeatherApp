//
//  NetworkManeger.swift
//  SwiftWeatherApp
//
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(errorDescription: String?)
    case decodingError(errorDescription: String)
}

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response , error in
            guard error == nil else {
                print("Fetch failed with error: \(error?.localizedDescription ?? " - ")")
                completionHandler(.failure(.error(errorDescription: error?.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200  else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let jsonObject = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(jsonObject))
            } catch let decodeError {
                if let error = decodeError as? DecodingError {
                    switch error {
                    case .typeMismatch(let key, let value):
                        print("Mismatch Error: \(key), value: \(value), Description: \(error.localizedDescription)")
                    case .valueNotFound(let key, let value):
                        print("Value not Error: \(key), value: \(value), Description: \(error.localizedDescription)")
                    case .keyNotFound(let key, let value):
                        print("Key not found error: \(key), value: \(value), Description: \(error.localizedDescription)")
                    case .dataCorrupted(let key):
                        print("Data Corrupted error: \(key), Description: \(error.localizedDescription)")
                    default:
                        print("ERROR: \(error.localizedDescription)")
                    }
                }
                completionHandler(.failure(.decodingError(errorDescription: decodeError.localizedDescription)))
            }
        }.resume()
    }
}


//
//final class NetworkManager<T: Codable> {
//
//    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            guard error == nil else {
//                print(String(describing: error!))
//                completion(.failure(.error(err: error!.localizedDescription)))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(.invalidData))
//                return
//            }
//
//            do {
//                print("Json Decoder")
//                let json = try  JSONDecoder().decode(T.self, from: data)
//                completion(.success(json))
//            }
//            catch let err {
//                print(String(describing: err))
//                print("Json Decoder2")
//                completion(.failure(.decodingError(err: err.localizedDescription)))
//
//            }
//
//        }.resume()
//    }
//}
//
//enum NetworkError: Error {
//
//    case invalidResponse
//    case invalidData
//    case error(err: String)
//    case decodingError(err: String)
//
//}
