import AltairMDKCommon

enum ListingException {
    case noResults
}

extension ListingException: Exception {
    var category: ExceptionCategory {
        .feature
    }
    
    var code: String {
        switch self {
            case .noResults: return "listing.ft.01"
        }
    }
    
    var errorTitle: String? {
        .none
    }
    
    var errorDescription: String? {
        switch self {
            case .noResults:
                return "The API does not bring results to show"
        }
    }

}
