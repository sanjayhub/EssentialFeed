//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 21/06/23.
//

import XCTest
class FeedImagePresenter {
    init(view: Any) {
        
    }
}

class FeedImagePresenterTests: XCTestCase {
    
    func test_init_does_notSendMessageToView() {
        let (_ , view) = makeSUT()
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK:- Helper
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (FeedImagePresenter, ViewSpy) {
        let view = ViewSpy()
        let sut = FeedImagePresenter(view: view)
        trackForMemoryLeaks(view,file: file, line: line)
        trackForMemoryLeaks(sut,file: file, line: line)
        return (sut, view)
    }
    
    private class ViewSpy {
        let messages = [Any]()
    }
}
