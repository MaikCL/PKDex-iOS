//
//  DIComponents.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import Resolver
import AltairMDKProviders

final public class DIComponents {
    
    public static func bind() {
        
        // MARK: Data layer components
        Resolver.register { StorageProvider(strategy: .coreData) }.implements(StorageProviderProtocol.self)
        Resolver.register { FavoritesLocalSource() }.implements(FavoritesLocalSourceProtocol.self)
        Resolver.register { FavoritesRepository() }.implements(FavoritesRepositoryProtocol.self)
        Resolver.register { FavoritesLocalMapper.mapModelToEntity }
        
        
//        Resolver.register { NetworkProvider(strategy: .nsUrlSession) }.implements(NetworkProviderProtocol.self)
//        Resolver.register { ListingCloudSource() }.implements(ListingCloudSourceProtocol.self)
//        Resolver.register { ListingRepository() }.implements(ListingRepositoryProtocol.self)
//        Resolver.register { ListingCloudMapper.mapModelToEntity }
        
        // MARK: Domain layer components
//        Resolver.register { (_, args) in GetPokemon(by: args()) }
        Resolver.register { (_, args) in AddFavorite(id: args()) }
        Resolver.register { (_, args) in RemoveFavorite(id: args()) }
        Resolver.register { GetFavorites() }

        // MARK: Presentation layer components
        Resolver.register { FavoritesSideEffects() }
        Resolver.register { FavoritesStore() }
        
    }

}
