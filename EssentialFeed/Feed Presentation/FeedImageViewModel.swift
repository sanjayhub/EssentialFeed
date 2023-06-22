//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 22/06/23.
//

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        return location != nil
    }
}

//final class FeedImageViewModel<Image> {
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
