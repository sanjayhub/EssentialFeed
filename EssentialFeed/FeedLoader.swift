//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 10/02/22.
//

import Foundation

enum LoadFeedResult {
    case Success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
