//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 10/02/22.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load(completion: @escaping (Result) -> Void)
}
