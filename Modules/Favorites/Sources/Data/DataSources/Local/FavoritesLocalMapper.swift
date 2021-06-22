//
//  FavoritesLocalMapper.swift
//  
//
//  Created by Miguel Angel on 02-06-21.
//

import AltairMDKCommon

class FavoritesLocalMapper: EntityFailableMapper {
    typealias Model = [FavoritesLocalModel]
    typealias Entity = Set<Int>
    
    static var mapModelToEntity: ([FavoritesLocalModel]) throws -> Set<Int> = { favoritesModel in
        var favorites = Set<Int>()
        favoritesModel.forEach { favorites.insert(Int($0.id)) }
        return favorites
    }
    
}
