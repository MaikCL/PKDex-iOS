//
//  SceneiOS.swift
//  PKDex (iOS)
//
//  Created by Miguel Angel on 30-04-21.
//

import SwiftUI

struct SceneiOS: View {
    private let router: AppRouter = AppRouter.shared
    
    var body: some View {
        router.route(to: .listing)
    }
}
