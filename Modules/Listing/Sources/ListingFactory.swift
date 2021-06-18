//
//  ListingFactory.swift
//  
//
//  Created by Miguel Angel on 07-05-21.
//

import Core
import SwiftUI
import AltairMDKCommon

public enum ListingFactory {

    public static func makeListingScene(with router: Router) -> some View {
        let viewModel = ListingViewModel(router: router)
        let scene = ListingScene<ListingViewModel>().environmentObject(viewModel)
        return scene.eraseToAnyView()
    }
    
}
