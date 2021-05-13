//
//  Icons.swift
//  
//
//  Created by Miguel Angel on 12-05-21.
//

import AltairMDKCommon
import SwiftUI

public enum SFSymbol: String  {
    case favorited = "star.fill"
    case unfavorited = "star"
    
    public var image: Image {
        switch self {
            case .favorited:
                return Image(systemName: "star.fill").renderingMode(.original)
            case .unfavorited:
                return Image(systemName: "star").renderingMode(.original)
        }
    }
}
