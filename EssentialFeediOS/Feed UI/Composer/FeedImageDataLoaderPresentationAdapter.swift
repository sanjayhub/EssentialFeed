//
//  FeedImageDataLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Kumar, Sanjay (623) on 24/06/23.
//

import EssentialFeed

final class FeedImageDataLoaderPresentationAdapter<View: FeedImageView, Image>: FeedImageCellControllerDelegate where View.Image == Image {
    private let imageLoader: FeedImageDataLoader
    private let model: FeedImage
    private var task: FeedImageDataLoaderTask?
    
    var presenter: FeedImagePresenter<View, Image>?
    
    init(imageLoader: FeedImageDataLoader, model: FeedImage) {
        self.imageLoader = imageLoader
        self.model = model
    }
    
    func didRequestImage() {
        presenter?.didStartLoadingImageData(for: model)
        
        let model = self.model
        task = self.imageLoader.loadImageData(from: model.url) { [weak self] result in
            switch result {
            case let .success(data):
                self?.presenter?.didFinishLoadingImageData(with: data, for: model)
            case let .failure(error):
                self?.presenter?.didFinishLoadingImageData(with: error, for: model)
            }
        }
    }
    
    func didCancelImageRequest() {
        task?.cancel()
    }
}
