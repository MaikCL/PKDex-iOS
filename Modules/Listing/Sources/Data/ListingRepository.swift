//
//  ListingRepository.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class ListingRepository: ListingRepositoryProtocol {
    @Injected private var cloudSource: ListingCloudSourceProtocol
    @Injected private var mapModelToEntity: (ListingCloudModel) throws -> [Pokemon]
    
    func getPokemonGenerationI() -> AnyPublisher<[Pokemon], Error> {
        cloudSource.getPokemonGenerationI().tryMap { try self.mapModelToEntity($0) }.eraseToAnyPublisher()
    }
}
