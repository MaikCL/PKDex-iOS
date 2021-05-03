//
//  PokemonMapper.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

final class PokemonMapper: ModelMapper {
    typealias Entity = [Pokemon]
    typealias Model = [PokemonModel]
    
    static var mapEntityToModel: ([Pokemon]) -> [PokemonModel] = { pokemons in
        return pokemons.compactMap { PokemonModel(name: $0.name) }
    }

}
