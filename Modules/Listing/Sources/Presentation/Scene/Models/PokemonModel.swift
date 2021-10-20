import Foundation
import AltairMDKCommon

struct PokemonModel: Identifiable {
    let id: Int
    let name: String
    var favorited: Toggleable
}
