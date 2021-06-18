//
//  PokemonMapper.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

// Modificar con mapper
final class PokemonMapper: ModelMapper {
    typealias Entity = (pokemons: [Pokemon], favorites: Set<Int>)
    typealias Model = [PokemonModel]
    
    static var mapEntityToModel: ((pokemons: [Pokemon], favorites: Set<Int>)) -> [PokemonModel] = { entity in
        return entity.pokemons.compactMap { pokemon in
            let isFavorite = entity.favorites.contains(pokemon.id)
            return PokemonModel(id: pokemon.id, name: pokemon.name, favorited: isFavorite ? .on : .off )
        }
    }

}
