//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 21/06/23.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
