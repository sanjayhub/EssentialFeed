//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 26/05/22.
//

import UIKit

public final class FeedImageCell: UITableViewCell {
    public let locationLabel = UILabel()
    public let locationContainer = UIView()
    public let descriptionLabel = UILabel()
    public let feedImageContainer = UIView()
    public let feedImageView = UIImageView()
    
    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button  = UIButton()
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var onRetry: (() -> Void)?
    
    @objc func retryButtonTapped() {
        onRetry?()
    }
}
