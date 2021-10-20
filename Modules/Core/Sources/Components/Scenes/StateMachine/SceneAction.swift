import Foundation

public enum SceneAction {
    case sceneDidActive(id: UUID)
    case sceneDidInactive(id: UUID)
    case sceneDidBackground(id: UUID)
}
