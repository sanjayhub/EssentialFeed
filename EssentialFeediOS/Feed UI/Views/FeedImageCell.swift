//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 26/05/22.
//

import UIKit

public final class FeedImageCell: UITableViewCell {
    @IBOutlet private(set) public var locationLabel: UILabel!
    @IBOutlet private(set) public var locationContainer: UIView!
    @IBOutlet private(set) public var descriptionLabel: UILabel!
    @IBOutlet private(set) public var feedImageContainer: UIView!
    @IBOutlet private(set) public var feedImageView: UIImageView!
    
    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button  = UIButton()
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var onRetry: (() -> Void)?
    
    @IBAction private func retryButtonTapped() {
        onRetry?()
    }
}
