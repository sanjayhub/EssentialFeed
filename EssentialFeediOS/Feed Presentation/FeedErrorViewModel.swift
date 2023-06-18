//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 18/06/23.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
