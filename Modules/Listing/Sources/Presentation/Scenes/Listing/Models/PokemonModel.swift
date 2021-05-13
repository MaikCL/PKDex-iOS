//
//  PokemonModel.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import Foundation
import AltairMDKCommon

struct PokemonModel: Identifiable {
    let id = UUID()
    let name: String
    var favorited: Toggleable
}
