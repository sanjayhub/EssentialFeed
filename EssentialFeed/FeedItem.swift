//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 10/02/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
