//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 09/06/23.
//
import Foundation
import EssentialFeed

struct FeedLoadingViewModel {
    let isLoading: Bool
}

protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

struct FeedViewModel {
    let feed: [FeedImage]
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}

final class FeedPresenter {
    
    var loadingView: FeedLoadingView?
    var feedView: FeedView?
    
    func didStartLoadingFeed() {
        loadingView?.display(FeedLoadingViewModel(isLoading: true))
    }
    
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        self.feedView?.display(FeedViewModel(feed: feed))
        self.loadingView?.display(FeedLoadingViewModel(isLoading: false))
    }
    
    func didFinishLoadingFeed(with error: Error) {
        self.loadingView?.display(FeedLoadingViewModel(isLoading: false))
    }
}
