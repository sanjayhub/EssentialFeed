//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 27/06/23.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
    
    public init() {}
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.success(.none))
    }
    
    
}
