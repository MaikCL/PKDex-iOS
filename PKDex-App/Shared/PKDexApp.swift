import Core
import SwiftUI
import Listing
import Favorites

@main
struct PKDexApp: App {
    
    init() {
        Core.DIComponents.bind()
        Listing.DIComponents.bind()
        Favorites.DIComponents.bind()
    }
    
    // MARK: Scene
    
    var body: some Scene {
        SceneiOS()
    }
}
