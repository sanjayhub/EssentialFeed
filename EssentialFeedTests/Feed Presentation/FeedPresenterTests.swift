//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 17/06/23.
//

import XCTest
import EssentialFeed

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
}

struct FeedViewModel {
    let feed: [FeedImage]
}

struct FeedLoadingViewModel {
    let isLoading: Bool
}
    
protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}
protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}

protocol FeedView {
    func display(_ viewModel: FeedViewModel)
}
class FeedPresenter {
    private let feedView : FeedView
    private let errorView: FeedErrorView
    private let loadingView: FeedLoadingView
    init(feedView : FeedView, loadingView: FeedLoadingView, errorView: FeedErrorView) {
        self.feedView = feedView
        self.loadingView = loadingView
        self.errorView = errorView
    }
    
    func didStartLoadingFeed() {
        errorView.display(.noError)
        loadingView.display(FeedLoadingViewModel(isLoading: true))
        
    }
    func didFinishLoadingFeed(with feed: [FeedImage]) {
        feedView.display(FeedViewModel(feed: feed))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}

class FeedPresenterTests: XCTestCase {

    func test_init_does_notSendMessageToView() {
        let (_ , view) = makeSUT()
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    func test_didStartLoadingFeed_displaysNoErrorMessage() {
        let (sut , view) = makeSUT()
        sut.didStartLoadingFeed()
        XCTAssertEqual(view.messages, [
            .display(errorMesssage: .none),
            .display(isLoading: true)])
    }
    
    func test_didFinishLoadingFeed_displaysFeedAandStopsLoading() {
        let (sut, view) = makeSUT()
        let feed = uniqueImageFeed().models
        sut.didFinishLoadingFeed(with: feed)
        XCTAssertEqual(view.messages, [
            .display(feed: feed),
            .display(isLoading: false)])
    }
    
    // MARK: - Helper
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(feedView: view, loadingView: view, errorView: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private class ViewSpy: FeedErrorView, FeedLoadingView, FeedView {

        enum Message: Hashable {
            case display(errorMesssage: String?)
            case display(isLoading: Bool)
            case display(feed: [FeedImage])
        }
        private(set) var messages = Set<Message>()
        
        func display(_ viewModel: FeedErrorViewModel) {
            messages.insert(.display(errorMesssage: viewModel.message))
        }
        
        func display(_ viewModel: FeedLoadingViewModel) {
            messages.insert(.display(isLoading: viewModel.isLoading))
        }
        
        func display(_ viewModel: FeedViewModel) {
            messages.insert(.display(feed: viewModel.feed))
        }
    }
}
