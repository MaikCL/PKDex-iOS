//
//  PKDexApp.swift
//  Shared
//
//  Created by Miguel Angel on 29-04-21.
//

import Core
import Listing
import SwiftUI

@main
struct PKDexApp: App {
    
    init() {
        Core.DIComponents.bind()
        Listing.DIComponents.bind()
    }
    
    var body: some Scene {
        SceneiOS()
    }
}
