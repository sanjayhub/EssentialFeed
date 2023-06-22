//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 22/06/23.
//

import Foundation

public protocol FeedImageView {
    associatedtype Image
    func display(_ model: FeedImageViewModel<Image>)
}

public final class FeedImagePresenter<View: FeedImageView, Image> where View
    .Image == Image {
        private let view: View
        private let imageTransformer: (Data) -> Image?
        
        public init(view: View, imageTransformer: @escaping (Data) -> Image? ) {
            self.view = view
            self.imageTransformer = imageTransformer
        }
        
        public func didStartLoadingImageData(for model: FeedImage) {
            view.display(
                FeedImageViewModel(
                    description: model.description, location: model.location, image: nil, isLoading: true, shouldRetry: false))
        }
        
        public func didFinishLoadingImageData(with data: Data, for model: FeedImage) {
            let image = imageTransformer(data)
            view.display(FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: image,
                isLoading: false,
                shouldRetry: image == nil))
        }
        
        public func didFinishLoadingImageData(with error: Error, for model: FeedImage) {
            view.display(FeedImageViewModel(
                description: model.description,
                location: model.location,
                image: nil,
                isLoading: false,
                shouldRetry: true))
        }
        }
//final class FeedImagePresenter<Image> {
//
//    typealias Observer<T> = (T) -> Void
//    private var task: FeedImageDataLoaderTask?
//    private let model: FeedImage
//    private let imageLoader: FeedImageDataLoader
//    private let imageTransformer: (Data) -> Image?
//
//    init(model: FeedImage, imageLoader: FeedImageDataLoader, imageTransformer: @escaping (Data) -> Image?) {
//        self.model = model
//        self.imageLoader = imageLoader
//        self.imageTransformer = imageTransformer
//    }
//
//    var description: String? {
//        model.description
//    }
//
//    var location: String? {
//        model.location
//    }
//
//    var hasLocation: Bool {
//        location != nil
//    }
//
//    var onImageLoad: Observer<Image>?
//    var onImageLoadingStateChange: Observer<Bool>?
//    var onShouldRetryImageLoadStateChange: Observer<Bool>?
//
//    func loadImageData() {
//        onImageLoadingStateChange?(true)
//        onShouldRetryImageLoadStateChange?(false)
//        task = self.imageLoader.loadImageData(from: self.model.url) { [weak self] result in
//            self?.handle(result)
//        }
//    }
//
//    private func handle(_ result: FeedImageDataLoader.Result) {
//        if let image = (try? result.get()).flatMap(imageTransformer) {
//            onImageLoad?(image)
//        } else {
//            onShouldRetryImageLoadStateChange?(true)
//        }
//        onImageLoadingStateChange?(false)
//    }
//
//    func cancelImageDataLoad() {
//        task?.cancel()
//        task = nil
//    }
//}
