//
//  GetFavorites.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class GetFavoritesUseCase: GetFavoritesUseCaseProtocol {
    @Injected private var favoritesRepo: FavoritesRepositoryProtocol
    
    func execute() -> AnyPublisher<Set<Int>, Error> {
        return favoritesRepo.getFavorites()
    }
}
