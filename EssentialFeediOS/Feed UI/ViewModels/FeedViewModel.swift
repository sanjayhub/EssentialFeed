//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 08/02/23.
//

import Foundation
import EssentialFeed

final class FeedViewModel {
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    private (set) var isLoading: Bool = false {
        didSet {
            onChange?(self)
        }
    }
    
    var onChange: ((FeedViewModel) -> Void)?
    
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    func load() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
        }
    }
}
