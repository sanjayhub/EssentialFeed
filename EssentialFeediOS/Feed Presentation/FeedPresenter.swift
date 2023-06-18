//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 09/06/23.
//
import Foundation
import EssentialFeed

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

struct FeedErrorViewModel {
    let message: String
}
protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}

final class FeedPresenter {
    
    private let loadingView: FeedLoadingView
    private let feedView: FeedView
    private let errorView: FeedErrorView
    
    init(loadingView: FeedLoadingView, feedView: FeedView, errorView: FeedErrorView) {
        self.loadingView = loadingView
        self.feedView = feedView
        self.errorView = errorView
    }
    
    static var title: String {
        NSLocalizedString("FEED_VIEW_TITLE", tableName: "Feed", bundle: Bundle(for: FeedPresenter.self),comment: "Title for the feed view")
    }
    
    private var feedLoadError: String {
        NSLocalizedString("FEED_VIEW_CONNECTION_ERROR", tableName: "Feed", bundle: Bundle(for: FeedPresenter.self),comment: "Error message displayed when we can't load the image feed from the server")

    }
    
    func didStartLoadingFeed() {
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        self.feedView.display(FeedViewModel(feed: feed))
        self.loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoadingFeed(with error: Error) {
        self.errorView.display(FeedErrorViewModel(message: feedLoadError))
        self.loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}
