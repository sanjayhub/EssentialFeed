//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 18/06/23.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
