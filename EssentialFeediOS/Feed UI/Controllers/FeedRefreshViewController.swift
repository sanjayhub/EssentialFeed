//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 02/06/22.
//

import UIKit
import EssentialFeed

protocol FeedRefreshViewControllerDelegate {
    func didRequestRefresh()
}

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    
    @IBOutlet private var view: UIRefreshControl?
    
    var delegate: FeedRefreshViewControllerDelegate?
    
    @IBAction func refresh() {
        delegate?.didRequestRefresh()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        } else {
            view?.endRefreshing()
        }
    }
}
