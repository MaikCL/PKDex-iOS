//
//  ListingCloudSource.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import APIs
import Combine
import Resolver
import AltairMDKProviders

final class ListingCloudSource: ListingCloudSourceProtocol {
    @Injected private var networkProvider: NetworkProviderProtocol
    
    func getPokemonGenerationI<T>() -> AnyPublisher<T, NetworkException> where T: Decodable {
        return networkProvider.agent.run(PokeAPI.pokedexNationalKanto())
    }
    
}
