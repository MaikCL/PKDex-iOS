//
//  PokemonMapper.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

// Modificar con mapper
final class PokemonMapper: ModelMapper {
    typealias Entity = [Pokemon]
    typealias Model = [PokemonModel]
    
    static var mapEntityToModel: ([Pokemon]) -> [PokemonModel] = { pokemons in
        return pokemons.compactMap { PokemonModel(id: $0.id, name: $0.name, favorited: .off) }
    }

}
