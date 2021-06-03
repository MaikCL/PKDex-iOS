//
//  FavoritesDataSources.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import Combine
import AltairMDKProviders

protocol FavoritesLocalSourceProtocol: AnyObject {
    func addFavorite(id: Int) -> AnyPublisher<Void, StorageException>
    func removeFavorite(id: Int) -> AnyPublisher<Void, StorageException>
    func getFavorites<T: Storable>() -> AnyPublisher<[T], StorageException>
}
