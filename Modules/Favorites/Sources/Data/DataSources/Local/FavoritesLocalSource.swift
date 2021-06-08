//
//  FavoritesLocalSource.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import Combine
import Resolver
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
        guard let favorite = storageProvider.agent.create(FavoritesLocalModel.self) else {
            return Fail(error: .objectNotSupported).eraseToAnyPublisher()
        }
        favorite.id = Int16(id)
        return storageProvider.agent.delete(object: favorite)
    }
    
    func getFavorites() -> AnyPublisher<[FavoritesLocalModel], StorageException> {
        return storageProvider.agent.readAll(FavoritesLocalModel.self, predicate: .none, sorted: .none).eraseToAnyPublisher()
    }

}
