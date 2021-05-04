//
//  NavigationReducer.swift
//  
//
//  Created by Miguel Angel on 04-05-21.
//

final class NavigationReducer {
    
    public static func reduce(_ state: NavigationState, _ action: NavigationAction) -> NavigationState {
        var currentState = state
        switch action {
            case .forward(to: let destination, style: let style):
                currentState.navigationStack.append((present: destination, style: style))
            case .back:
                guard !currentState.navigationStack.isEmpty else { return currentState }
                currentState.navigationStack.removeLast()
        }
        return currentState
    }

}
