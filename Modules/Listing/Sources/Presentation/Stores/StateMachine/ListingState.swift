import AltairMDKCommon

struct ListingState {
    var pokemons: Loadable<[Pokemon]>
    var exception: Exception?
}

extension ListingState {
    static var initial: ListingState {
        .init(
            pokemons: .neverLoaded,
            exception: .none
        )
    }
}
