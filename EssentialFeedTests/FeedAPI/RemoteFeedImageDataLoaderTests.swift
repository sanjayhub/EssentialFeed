//
//  RemoteFeedImageDataLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 29/06/23.
//

import XCTest

class RemoteFeedImageDataLoader {
    init(client: Any) {
    }
}

class RemoteFeedImageDataLoaderTests: XCTestCase {
    
    func test_init_doesNotPerformAnyURLRequest() {
        let (_, client) = makeSUT()
        XCTAssertTrue(client.requestedURL.isEmpty)
    }
    
    //MARK :- Helpers
    
    private func makeSUT(url:URL =  anyURL(), file: StaticString = #filePath, line: UInt = #line) -> (sut: RemoteFeedImageDataLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedImageDataLoader(client: client)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(client, file: file, line: line)
        return (sut, client)
    }
    
    private class HTTPClientSpy {
        var requestedURL = [URL]()
    }
}
