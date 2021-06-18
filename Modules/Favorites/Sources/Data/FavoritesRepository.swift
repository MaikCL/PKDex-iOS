//
//  FavoritesRepository.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class FavoritesRepository: FavoritesRepositoryProtocol {
    @Injected private var localSource: FavoritesLocalSourceProtocol
    @Injected private var mapModelToEntity: ([FavoritesLocalModel]) throws -> Set<Int>
    
    func getFavorites() -> AnyPublisher<Set<Int>, Error> {
        localSource.getFavorites().tryMap { try self.mapModelToEntity($0) }.eraseToAnyPublisher()
    }
    
    func addFavorite(id: Int) -> AnyPublisher<Void, Error> {
        localSource.addFavorite(id: id).mapError { $0 }.eraseToAnyPublisher()
    }
    
    func removeFavorite(id: Int) -> AnyPublisher<Void, Error> {
        localSource.removeFavorite(id: id).mapError { $0 }.eraseToAnyPublisher()
    }
    
}
