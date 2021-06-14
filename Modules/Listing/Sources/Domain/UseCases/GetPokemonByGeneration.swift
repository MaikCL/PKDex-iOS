//
//  GetPokemon.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class GetPokemonByGeneration: GetPokemonByGenerationProtocol {
    @Injected private var listingRepo: ListingRepositoryProtocol
    
    func execute(generation: PokemonGeneration) -> AnyPublisher<[Pokemon], Error> {
        switch generation {
            case .generationI:
                return listingRepo.getPokemonGenerationI()
        }
    }
}
