//
//  CellView.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import Design
import SwiftUI
import AltairMDKCommon

struct CellView: View {
    var pokemon: PokemonModel
    var favoriteAction: (Toggleable) -> Void
    
    var body: some View {
        HStack {
            Text(pokemon.name)
            Spacer()
            (pokemon.favorited.state ? SFSymbol.favorited.image : SFSymbol.unfavorited.image)
                .onTapGesture {
                    switch pokemon.favorited {
                        case .on:
                            favoriteAction(.off)
                        case .off:
                            favoriteAction(.on)
                    }
                }
        }
    }

}

//struct CellView_Previews: PreviewProvider {
//    private static let fakeModel = PokemonModel(name: "Zapdos", favorited: .off)
//    static var previews: some View {
//        CellView(pokemon: .constant(fakeModel))
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
