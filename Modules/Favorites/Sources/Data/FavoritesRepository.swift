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
    
    func getFavorites() -> AnyPublisher<Set<Int>, Error> {
        return Empty().eraseToAnyPublisher()
    }
    
    func addFavorite(id: Int) -> AnyPublisher<Void, Error> {
        return Empty().eraseToAnyPublisher()
    }
    
    func removeFavorite(id: Int) -> AnyPublisher<Void, Error> {
        return Empty().eraseToAnyPublisher()
    }
    
}

 //  ------>>>>>    "HACER LOS DATASOURCES"


//final class ListingRepository: ListingRepositoryProtocol {
//    @Injected private var cloudSource: ListingCloudSourceProtocol
//    @Injected private var mapModelToEntity: (ListingCloudModel) throws -> [Pokemon]
//
//    func getPokemonGenerationI() -> AnyPublisher<[Pokemon], Error> {
//        cloudSource.getPokemonGenerationI().tryMap { try self.mapModelToEntity($0) }.eraseToAnyPublisher()
//    }
//}
