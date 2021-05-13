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
    @Binding var pokemon: PokemonModel
    
    var body: some View {
        HStack {
            Text(pokemon.name)
            Spacer()
            FavoriteButtonView(isFavorited: $pokemon.favorited)
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
