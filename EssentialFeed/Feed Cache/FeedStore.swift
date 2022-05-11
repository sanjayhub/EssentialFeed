//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 09/04/22.
//

import Foundation

public enum CachedFeed {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
}

public protocol FeedStore {
    typealias DeletionCompletion = ((Error)?) -> Void
    typealias InsertionCompletion = ((Error)?) -> Void
    
    typealias RetrieveResult = Result<CachedFeed, Error>
    typealias RetrievalCompletion = (RetrieveResult) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}

