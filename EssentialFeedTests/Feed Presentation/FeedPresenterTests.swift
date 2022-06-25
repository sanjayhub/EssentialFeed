//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 25/06/22.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {

    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        _ = FeedPresenter(view: view)
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    private class ViewSpy {
        let messages = [String]()
    }

}
