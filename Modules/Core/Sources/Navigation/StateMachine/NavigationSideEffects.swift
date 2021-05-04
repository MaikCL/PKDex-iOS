//
//  NavigationSideEffects.swift
//  
//
//  Created by Miguel Angel on 04-05-21.
//

import Combine
import AltairMDKCommon

final class NavigationSideEffects {
    
    func whenInput(_ action: AnyPublisher<NavigationAction, Never>) -> SideEffect<NavigationAction> {
        SideEffect { _ in action }
    }
    
}
