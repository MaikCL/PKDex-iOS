//
//  DIComponents.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Resolver

final public class DIComponents {
    
    public static func bind() {
        Resolver.register { SceneSideEffects() }
        Resolver.register { SceneStore() }
    }
    
}
