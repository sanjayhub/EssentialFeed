//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 24/06/23.
//

import EssentialFeed

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: FeedLoader
    var presenter: FeedPresenter?
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    func didRequestRefresh() {
        presenter?.didStartLoadingFeed()
        self.feedLoader.load { [weak self] result in
            switch result {
            case let .success(feed):
                self?.presenter?.didFinishLoadingFeed(with: feed)
            case let .failure(error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        }
    }
}
