//
//  DetailFactory.swift
//  
//
//  Created by Miguel Angel on 17-06-21.
//

import Core
import SwiftUI
import AltairMDKCommon

public enum DetailFactory {
    
    public static func makeDetailScene(with router: Router) -> some View {
        let viewModel = DetailViewModel(router: router)
        let scene = DetailScene<DetailViewModel>().environmentObject(viewModel)
        return scene.eraseToAnyView()
    }
    
}
