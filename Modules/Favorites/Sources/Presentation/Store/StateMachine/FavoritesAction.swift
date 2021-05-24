//
//  FavoriteAction.swift
//  
//
//  Created by Miguel Angel on 24-05-21.
//

import AltairMDKCommon

enum FavoritesAction {
    case getFavorites(_ result: Set<Int>)
    case favorite(id: Int)
    case unfavorite(id: Int)
    case favoritedFailed(_ exception: Exception, id: Int)
    case unfavoritedFailed(_ exception: Exception, id: Int)
}
