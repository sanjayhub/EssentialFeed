//
//  FeedCacheTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 12/04/22.
//

import Foundation
import EssentialFeed

func uniqueImage() -> FeedImage {
    return FeedImage(id: UUID(), description: "any description", location: "any", url: anyURL())
}

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage] ) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id, description: $0.description, location: $0.location, url: $0.url)}
    return (models, local)
}

extension Date {
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}
