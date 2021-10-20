import AltairMDKCommon

public struct FavoritesState {
    public var favorites: Set<Int>
    public var exception: Exception?
}

extension FavoritesState {
    static var initial: FavoritesState {
        .init(
            favorites: [],
            exception: .none
        )
    }
}
