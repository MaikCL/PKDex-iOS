//
//  ListingRepositoryProtocol.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine

protocol ListingRepositoryProtocol: AnyObject {
    func getPokemonGenerationI() -> AnyPublisher<[Pokemon], Error>
}
