//
//  DetailViewModel.swift
//  
//
//  Created by Miguel Angel on 17-06-21.
//

import Core
import Combine
import SwiftUI
import AltairMDKCommon

final class DetailViewModel: DetailViewModelProtocol {
    private var cancellables = Set<AnyCancellable>()
    let router: Router?
    
    init(router: Router) {
        self.router = router
    }
}
