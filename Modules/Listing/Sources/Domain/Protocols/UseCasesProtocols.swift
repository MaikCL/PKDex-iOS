//
//  UseCasesProtocols.swift
//  
//
//  Created by Miguel Angel on 14-06-21.
//

import Combine

protocol GetPokemonByGenerationProtocol: AnyObject {
    func execute(generation: PokemonGeneration) -> AnyPublisher<[Pokemon], Error>
}
