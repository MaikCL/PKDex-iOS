//
//  DIComponents.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import Resolver
import Foundation
import AltairMDKProviders

final public class DIComponents {
    
    public static func bind() {
        
        // MARK: Data layer components
        let dbUrl = Bundle.module.url(forResource: "FavoritesModel", withExtension: "momd")
        Resolver.register { StorageProvider(strategy: .coreData(dbFile: dbUrl)) }.implements(StorageProviderProtocol.self)
        Resolver.register { FavoritesLocalSource() }.implements(FavoritesLocalSourceProtocol.self)
        Resolver.register { FavoritesRepository() }.implements(FavoritesRepositoryProtocol.self)
        Resolver.register { FavoritesLocalMapper.mapModelToEntity }
        
        // MARK: Domain layer components
        Resolver.register { AddFavoriteUseCase() }.implements(AddFavoriteUseCaseProtocol.self)
        Resolver.register { GetFavoritesUseCase() }.implements(GetFavoritesUseCaseProtocol.self)
        Resolver.register { RemoveFavoriteUseCase() }.implements(RemoveFavoriteUseCaseProtocol.self)

        // MARK: Presentation layer components
        Resolver.register { FavoritesSideEffects() }
        Resolver.register { FavoritesStore() }
        
    }

}
