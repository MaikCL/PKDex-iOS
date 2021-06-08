//
//  FavoritesDataSources.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import Combine
import AltairMDKProviders
import CoreData

// TODO: Improve to generic signature "getFavorites<T: Storable>() -> AnyPublisher<[T], StorageException>" - Miguel A. Zapata (13/07/20)
protocol FavoritesLocalSourceProtocol: AnyObject {
    func addFavorite(id: Int) -> AnyPublisher<Void, StorageException>
    func removeFavorite(id: Int) -> AnyPublisher<Void, StorageException>
    func getFavorites() -> AnyPublisher<[FavoritesLocalModel], StorageException>
}
