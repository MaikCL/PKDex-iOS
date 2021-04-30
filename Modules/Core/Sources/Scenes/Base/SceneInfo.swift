//
//  SceneInfo.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import Foundation

public struct SceneInfo {
    let id: UUID
    let phase: Phase
    
    enum Phase {
        case active
        case inactive
        case background
    }
}

extension SceneInfo.Phase: CustomStringConvertible {
    public var description: String {
        switch self {
            case .active:
                return ".active"
            case .inactive:
                return ".inactive"
            case .background:
                return ".background"
        }
    }
}
