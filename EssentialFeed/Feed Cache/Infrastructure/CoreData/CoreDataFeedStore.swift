//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Kumar, Sanjay (623) on 25/12/22.
//

import Foundation
import CoreData

public final class CoreDataFeedStore: FeedStore {
    
    private static let modelName = "FeedStore"
    private static let model = NSManagedObjectModel.with(name: modelName, in: Bundle(for: CoreDataFeedStore.self))
    
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    
    enum StoreError: Error {
        case modelNotFound
        case failedToLoadPersistentContainer(Error)
    }
    
    public init(storeURL: URL) throws {
        guard let model = CoreDataFeedStore.model else {
            throw StoreError.modelNotFound
        }
        
        do {
            container = try NSPersistentContainer.load(name: CoreDataFeedStore.modelName, model: model, url: storeURL)
            context = container.newBackgroundContext()
        } catch {
            throw StoreError.failedToLoadPersistentContainer(error)
        }
    }
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
        perform { context in
            completion(Result {
                try ManagedCache.find(in: context).map(context.delete).map(context.save)
            })
            /*
            do {
                try ManagedCache.find(in: context).map(context.delete).map(context.save)
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
             */
        }
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        perform { context in
            completion(Result {
                let managedCache = try ManagedCache.newUniqueInstance(in: context)
                managedCache.timestamp = timestamp
                managedCache.feed = ManagedFeedImage.images(from: feed, in: context)
                try context.save()
            })
            /*
            do {
                let managedCache = try ManagedCache.newUniqueInstance(in: context)
                managedCache.timestamp = timestamp
                managedCache.feed = ManagedFeedImage.images(from: feed, in: context)
                try context.save()
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
             */
        }
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        perform { context in
            completion(Result {
                try ManagedCache.find(in: context).map {
                    return CachedFeed(
                        feed: $0.localFeed,
                        timestamp: $0.timestamp
                    )
                }
            })
//            do {
//                if let cache = try ManagedCache.find(in: context){
//                    completion(.success(
//                        CachedFeed(
//                            feed: cache.localFeed,
//                            timestamp: cache.timestamp
//                        )))
//                } else {
//                    completion(.success(.none))
//                }
//            } catch {
//                completion(.failure(error))
//            }
        }
    }
    
}

extension CoreDataFeedStore {
    // MARK: - private function
    private func perform( _ action: @escaping (NSManagedObjectContext) -> Void ) {
        let context = self.context
        context.perform {
            action(context)
        }
    }
}
