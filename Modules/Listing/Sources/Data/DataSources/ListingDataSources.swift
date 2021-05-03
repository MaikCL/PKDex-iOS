//
//  ListingDataSources.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine
import AltairMDKProviders

protocol ListingCloudSourceProtocol: AnyObject {
    func getPokemonGenerationI<T: Decodable>() -> AnyPublisher<T, NetworkException>
}
