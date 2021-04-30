//
//  DIComponents.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Resolver

final public class DIComponents {
    
    public static func bind() {
        
        // MARK: Domain layer components
        Resolver.register { (_, args) in GetPokemon(by: args()) }

    }
    
}
