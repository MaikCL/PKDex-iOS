//
//  UsesCasesProtocols.swift
//  
//
//  Created by Miguel Angel on 14-06-21.
//

import Combine

protocol GetFavoritesUseCaseProtocol: AnyObject {
    func execute() -> AnyPublisher<Set<Int>, Error>
}

protocol AddFavoriteUseCaseProtocol: AnyObject {
    func execute(id: Int) -> AnyPublisher<Void, Error>
}

protocol RemoveFavoriteUseCaseProtocol: AnyObject {
    func execute(id: Int) -> AnyPublisher<Void, Error>
}
