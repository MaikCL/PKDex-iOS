//
//  Created by Miguel Angel on 24-03-21.
//

import Foundation

public enum SceneAction {
    case sceneDidActive(id: UUID)
    case sceneDidInactive(id: UUID)
    case sceneDidBackground(id: UUID)
}
