//
//  FavoriteButtonView.swift
//  
//
//  Created by Miguel Angel on 12-05-21.
//

import SwiftUI
import AltairMDKCommon

public struct FavoriteButtonView: View {
    @Binding var isFavorited: Toggleable
    
    public init (isFavorited: Binding<Toggleable>) {
        self._isFavorited = isFavorited
    }
    
    public var body: some View {
        (isFavorited.state ? SFSymbol.favorited.image : SFSymbol.unfavorited.image)
            .onTapGesture {
                isFavorited.toggle()
            }
    }
    
}
