//
//  FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 01/07/22.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
