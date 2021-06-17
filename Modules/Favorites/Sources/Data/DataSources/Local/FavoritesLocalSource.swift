//
//  FavoritesLocalSource.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import Combine
import Resolver
import Foundation
import AltairMDKProviders

final class FavoritesLocalSource: FavoritesLocalSourceProtocol {
    @Injected private var storageProvider: StorageProviderProtocol
    
    func addFavorite(id: Int) -> AnyPublisher<Void, StorageException> {
        guard let favorite = storageProvider.agent.create(FavoritesLocalModel.self) else {
            return Fail(error: .objectNotSupported).eraseToAnyPublisher()
        }
        favorite.id = Int16(id)
        return storageProvider.agent.insert(object: favorite)
    }
    
    func removeFavorite(id: Int) -> AnyPublisher<Void, StorageException> {
        let predicate = NSPredicate(format: "id == %i", id)
        return storageProvider.agent.readFirst(FavoritesLocalModel.self, predicate: predicate)
            .map { favorite -> AnyPublisher<Void, StorageException> in
                guard let favorite = favorite else { return Just(()).setFailureType(to: StorageException.self).eraseToAnyPublisher() }
                return self.storageProvider.agent.delete(object: favorite)
            }
            .switchToLatest()
            .eraseToAnyPublisher()
    }
    
    func getFavorites() -> AnyPublisher<[FavoritesLocalModel], StorageException> {
        return storageProvider.agent.readAll(FavoritesLocalModel.self, predicate: .none).eraseToAnyPublisher()
    }

}
