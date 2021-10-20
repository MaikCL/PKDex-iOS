import AltairMDKCommon

enum FavoritesException {
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
