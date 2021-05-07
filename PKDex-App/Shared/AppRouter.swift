//
//  AppRouter.swift
//  PKDex (iOS)
//
//  Created by Miguel Angel on 07-05-21.
//

import Core
import Detail
import Listing
import SwiftUI
import AltairMDKCommon

final class AppRouter: Router {
    
    static let shared = AppRouter()
    
    private init() { }
    
    func route(to destination: Destination) -> AnyView {
        switch destination {
            case .listing:
                return LazyView(ListingFactory.makeScene(with: self)).eraseToAnyView()
            case .detail:
                // TODO: Temporal implementation
                return LazyView(DetailView1(viewModel: DetailViewModel(router: self))).eraseToAnyView()
        }
    }
    
}
