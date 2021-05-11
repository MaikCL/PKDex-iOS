//
//  File.swift
//  
//
//  Created by Miguel Angel on 07-05-21.
//

import SwiftUI
import Core
import AltairMDKCommon

public enum ListingFactory {

    public static func makeListingScene(with router: Router) -> some View {
        let viewModel = ListingViewModel(router: router)
        let scene = ListingScene(viewModel: viewModel)
        return scene.eraseToAnyView()
    }
    
}
