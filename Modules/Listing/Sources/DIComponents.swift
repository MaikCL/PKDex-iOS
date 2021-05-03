//
//  DIComponents.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Resolver
import AltairMDKProviders

final public class DIComponents {
    
    public static func bind() {
        
        // MARK: Data layer components
        Resolver.register { NetworkProvider(strategy: .nsUrlSession) }.implements(NetworkProviderProtocol.self)
        Resolver.register { ListingCloudSource() }.implements(ListingCloudSourceProtocol.self)
        Resolver.register { ListingRepository() }.implements(ListingRepositoryProtocol.self)
        Resolver.register { ListingCloudMapper.mapModelToEntity }
        
        // MARK: Domain layer components
        Resolver.register { (_, args) in GetPokemon(by: args()) }

        // MARK: Presentation layer components
        Resolver.register { PokemonMapper.mapEntityToModel }
        Resolver.register { ListingSideEffects() }
        Resolver.register { ListingStore() }
        
    }

}
