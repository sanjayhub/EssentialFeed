//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 30/06/23.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
