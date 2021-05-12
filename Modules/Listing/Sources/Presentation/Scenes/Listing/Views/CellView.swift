//
//  CellView.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import SwiftUI

struct CellView: View {
    var pokemon: PokemonModel
    
    var body: some View {
        Text(pokemon.name)
    }
}

struct CellView_Previews: PreviewProvider {
    private static let fakeModel = PokemonModel(name: "Zapdos")
    static var previews: some View {
        CellView(pokemon: fakeModel)
    }
}
