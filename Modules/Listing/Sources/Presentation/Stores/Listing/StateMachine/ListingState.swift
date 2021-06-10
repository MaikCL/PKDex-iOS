//
//  ListingState.swift
//  
//
//  Created by Miguel Angel on 02-05-21.
//

import AltairMDKCommon

enum ListingState {
    case initial
    case loading(PokemonGeneration)
    case loaded([Pokemon])
    case exception(Exception)
}
