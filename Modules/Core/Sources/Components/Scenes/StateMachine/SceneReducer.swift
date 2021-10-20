import Foundation
import AltairMDKCommon

final class SceneReducer {
    
    public static func reduce(state: inout SceneState, action: SceneAction) {
        switch action {
            case .sceneDidActive(id: let id):
                changeSceneState(&state, to: (id: id, phase: .active))
            case .sceneDidInactive(id: let id):
                changeSceneState(&state, to: (id: id, phase: .inactive))
            case .sceneDidBackground(id: let id):
                changeSceneState(&state, to: (id: id, phase: .background))
        }
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
