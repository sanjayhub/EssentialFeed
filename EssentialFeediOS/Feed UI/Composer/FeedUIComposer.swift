//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 09/06/22.
//

import UIKit
import EssentialFeed

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposeWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: DispatchQueueDecorator(decoratee: feedLoader))
        
        let feedController = makeFeedViewController(
            delegate: presentationAdapter,
            title: FeedPresenter.title)
        
        presentationAdapter.presenter = FeedPresenter(
            loadingView: WeakRefVirtualProxy(feedController),
            feedView: FeedViewAdapter(controller: feedController, loader: DispatchQueueDecorator(decoratee: imageLoader)))
        
        return feedController
    }
    
    
    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let storyBoard = UIStoryboard(name: "Feed", bundle: Bundle(for: FeedViewController.self))
        let feedController = storyBoard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
}

