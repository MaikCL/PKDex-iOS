//
//  ListingCloudMapper.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import AltairMDKCommon

class ListingCloudMapper: EntityFailableMapper {
    typealias Model = ListingCloudModel
    typealias Entity = [Pokemon]
    
    static var mapModelToEntity: (ListingCloudModel) throws -> [Pokemon] = { model in
        guard let results = model.results else { throw MapperException.cantMapToEntity }
        return results.compactMap { result -> Pokemon? in
            guard let name = result.name else { return nil }
            return Pokemon(name: name)
        }
    }
    
}
