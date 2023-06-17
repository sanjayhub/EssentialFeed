//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 17/06/23.
//

import XCTest

class FeedPresenter {
    init(view: Any) {
    }
}

class FeedPresenterTests: XCTestCase {

    func test_init_does_notSendMessageToView() {
        let view = ViewSpy()
        _ = FeedPresenter(view: view)
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helper
    class ViewSpy {
        var messages = [Any]()
    }
}
