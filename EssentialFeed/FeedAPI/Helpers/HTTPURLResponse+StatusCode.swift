//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 30/06/23.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    var isOK: Bool {
        statusCode == HTTPURLResponse.OK_200
    }
}
