import AltairMDKCommon

public struct SceneState {
    public var loadedScenes: [SceneInfo]
}

extension SceneState {
    
    static var initial: SceneState {
        .init(loadedScenes: [])
    }
    
}
