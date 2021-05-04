//
//  NavigationState.swift
//  
//
//  Created by Miguel Angel on 04-05-21.
//

public struct NavigationState {
    public var navigationStack: [(present: Destination, style: NavigationStyle)]
}

extension NavigationState {
    
    static var initial: NavigationState {
        .init(navigationStack: [])
    }

}
