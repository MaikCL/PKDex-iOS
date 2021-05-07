//
//  SceneReducer.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Foundation

final class SceneReducer {
    
    public static func reduce(_ state: SceneState, _ action: SceneAction) -> SceneState {
        var currentState = state
        switch action {
            case .sceneDidActive(id: let id):
                changeSceneState(&currentState, to: (id: id, phase: .active))
            case .sceneDidInactive(id: let id):
                changeSceneState(&currentState, to: (id: id, phase: .inactive))
            case .sceneDidBackground(id: let id):
                changeSceneState(&currentState, to: (id: id, phase: .background))
        }
        return currentState
    }
    
}

extension SceneReducer {
    
    fileprivate static func changeSceneState(_ state: inout SceneState, to: (id: UUID, phase: SceneInfo.Phase)) {
        if let sceneIndex = state.loadedScenes.firstIndex(where: { $0.id == to.id }) {
            state.loadedScenes[sceneIndex] = SceneInfo(id: to.id, phase: to.phase)
        } else {
            state.loadedScenes.append(SceneInfo(id: to.id, phase: to.phase))
        }
    }
    
}
