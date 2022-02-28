//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 21/02/22.
//

import Foundation

public enum HTTPClientResult {
    case success(Data,HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}


