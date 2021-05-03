//
//  SceneState.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Foundation

public struct SceneState {
    public var loadedScenes: [SceneInfo]
}

extension SceneState {
    
    static var initial: SceneState {
        .init(loadedScenes: [])
    }
    
}
