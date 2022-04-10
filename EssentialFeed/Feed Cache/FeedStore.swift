//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 09/04/22.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = ((Error)?) -> Void
    typealias InsertionCompletion = ((Error)?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}

