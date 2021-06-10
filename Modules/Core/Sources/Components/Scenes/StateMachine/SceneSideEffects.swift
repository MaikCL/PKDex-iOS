//
//  SceneSideEffects.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Combine
import AltairMDKCommon

final class SceneSideEffects {
    
    func whenInput(_ action: AnyPublisher<SceneAction, Never>) -> SideEffect<SceneState, SceneAction> {
        SideEffect { _ in action }
    }
    
}
