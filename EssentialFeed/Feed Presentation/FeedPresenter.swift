//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 27/06/22.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}

public protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}

public struct FeedLoadingViewModel {
    public let isLoading: Bool
}

public protocol FeedLoadingView: AnyObject {
    func display(_ viewModel: FeedLoadingViewModel)
}

public struct FeedViewModel {
    public let feed: [FeedImage]
}

public  protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

public final class FeedPresenter {
    private let errorView: FeedErrorView
    private let loadingView: FeedLoadingView
    private let feedView: FeedView
    
    private var feedLoadError: String {
        return NSLocalizedString("FEED_VIEW_CONNECTION_ERROR", tableName: "Feed", bundle: Bundle(for: FeedPresenter.self), comment: "Error message displayed when we can't load the image feeds from the server")
    }
    
    public static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE", tableName: "Feed", bundle: Bundle(for: FeedPresenter.self), comment: "Title for feed view")
    }
    
   public init(feedView: FeedView, loadingView: FeedLoadingView, errorView: FeedErrorView) {
        self.feedView = feedView
        self.loadingView = loadingView
        self.errorView = errorView
    }
    
    public func didStartLoadingFeed() {
        errorView.display(.noError)
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
    
    public func didFinishLoadingWithError(with error: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}
