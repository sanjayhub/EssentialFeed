//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 10/04/22.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
