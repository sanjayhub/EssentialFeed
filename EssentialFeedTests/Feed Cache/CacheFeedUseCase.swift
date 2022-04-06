//
//  CacheFeedUseCase.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 06/04/22.
//

import XCTest
import EssentialFeed

class LocalFeedLoader {
    private let store: FeedStore
    init(store: FeedStore) {
        self.store = store
    }
    func save(_ items: [FeedItem]) {
        store.deleteCachedFeed()
    }
}

class FeedStore {
    var deleteCachedFeedCount = 0
    func deleteCachedFeed() {
        deleteCachedFeedCount += 1
    }
}

class CacheFeedUseCase: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        let _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCachedFeedCount, 0)
    }
    
    func test_save_requestCacheDeletion() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        let items = [createFeedItem(),createFeedItem()]
        sut.save(items)
        XCTAssertEqual(store.deleteCachedFeedCount, 1)
    }
    
    // MARK: - Helpers
    
    private func createFeedItem() -> FeedItem {
        return FeedItem(id: UUID(), description: "any description", location: "any", imageURL: anyURL())
    }
    
    private func anyURL() -> URL {
        return URL(string: "http://a-url.com")!
    }
}
