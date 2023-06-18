//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 17/06/23.
//

import XCTest

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
}
    
protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}
class FeedPresenter {
    private let errorView: FeedErrorView
    init(errorView: FeedErrorView) {
        self.errorView = errorView
    }
    
    func didStartLoadingFeed() {
        errorView.display(.noError)
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
        XCTAssertEqual(view.messages, [.display(errorMesssage: .none)])
    }
    
    // MARK: - Helper
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(errorView: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private class ViewSpy: FeedErrorView {
        func display(_ viewModel: FeedErrorViewModel) {
            messages.append(.display(errorMesssage: viewModel.message))
        }
        
        enum Message: Equatable {
            case display(errorMesssage: String?)
        }
        private(set) var messages = [Message]()
    }
}
