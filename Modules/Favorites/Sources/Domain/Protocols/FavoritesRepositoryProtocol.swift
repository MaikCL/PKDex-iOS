//
//  FavoritesRepositoryProtocol.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import Combine

protocol FavoritesRepositoryProtocol: AnyObject {
    func getFavorites() -> AnyPublisher<Set<Int>, Error>
    func addFavorite(id: Int) -> AnyPublisher<Void, Error>
    func removeFavorite(id: Int) -> AnyPublisher<Void, Error>
}
