//
//  FavoritesException.swift
//  
//
//  Created by Miguel Angel on 08-06-21.
//

import AltairMDKCommon

enum FavoritesException {
    /// Unrecognizer Exception with an underlying error
    case unknown(Error)
}

extension FavoritesException: Exception {
    
    var category: ExceptionCategory {
        .feature
    }
    
    var code: String {
        switch self {
            case .unknown: return "favorites.ft.01"
        }
    }
    
    var errorDescription: String? {
        switch self {
            case .unknown(let error):
                return "Unrecognizer Exception: \(error.localizedDescription)"
        }
    }
    
}
