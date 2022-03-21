//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 20/03/22.
//

import Foundation

extension URLSession: HTTPClient {

    private struct UnexpectedValueRepresentation: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValueRepresentation()))
            }
        }.resume()
    }
}
