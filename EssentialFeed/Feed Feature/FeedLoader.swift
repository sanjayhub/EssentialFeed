//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 10/02/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
