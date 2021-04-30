//
//  ListingException.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

import AltairMDKCommon

enum ListingException {
    /// Unrecognizer Exception with an underlying error
    case unknown(Error)
    
    /// The API does not bring results to show
    case noResults
}

extension ListingException: Exception {
    
    var category: ExceptionCategory {
        .feature
    }
    
    var code: String {
        switch self {
            case .unknown: return "listing.ft.01"
            case .noResults: return "listing.ft.02"
        }
    }
    
    var errorDescription: String? {
        switch self {
            case .unknown(let error):
                return "Unrecognizer Exception: \(error.localizedDescription)"
            case .noResults:
                return "The API does not bring results to show"
        }
    }
    
}
