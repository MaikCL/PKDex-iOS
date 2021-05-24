//
//  AddFavorites.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine
import Resolver
import AltairMDKCommon

final class AddFavorite: UseCase {
    typealias T = Void
    
    private let id: Int
    
    @Injected private var favoritesRepo: FavoritesRepositoryProtocol
    
    init(id: Int) {
        self.id = id
    }
    
    func execute() -> AnyPublisher<Void, Error> {
        return favoritesRepo.addFavorite(id: id)
    }
}
