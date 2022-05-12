//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 21/02/22.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    func get(from url: URL, completion: @escaping (Result) -> Void)
}


