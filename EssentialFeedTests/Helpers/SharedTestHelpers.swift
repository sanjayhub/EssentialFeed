//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Kumar, Sanjay (623) on 13/04/22.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://a-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
