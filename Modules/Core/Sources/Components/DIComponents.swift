import Resolver
import AltairMDKCommon

final public class DIComponents {
    
    public static func bind() {
        Resolver.register { Store<SceneState, SceneAction>(
            state: .initial,
            reducer: SceneReducer.reduce(state:action:))
        }
    }
    
}
