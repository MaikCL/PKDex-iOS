//
//  GetPokemon.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class GetPokemon: UseCase {
    typealias T = [Pokemon]
    private let selectedGeneraton: PokemonGeneration
    
    @Injected private var listingRepo: ListingRepositoryProtocol
    
    init(by generation: PokemonGeneration) {
        self.selectedGeneraton = generation
    }
    
    func execute() -> AnyPublisher<[Pokemon], Error> {
        switch selectedGeneraton {
            case .generationI:
                return listingRepo.getPokemonGenerationI()
        }
    }

}
