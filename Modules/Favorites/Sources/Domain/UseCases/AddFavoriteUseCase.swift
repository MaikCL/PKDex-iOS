//
//  AddFavorites.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class AddFavoriteUseCase: AddFavoriteUseCaseProtocol {
    @Injected private var favoritesRepo: FavoritesRepositoryProtocol
    
    func execute(id: Int) -> AnyPublisher<Void, Error> {
        return favoritesRepo.addFavorite(id: id)
    }
    
}
