//
//  ListingCloudModel.swift
//  
//
//  Created by Miguel Angel on 30-04-21.
//

struct ListingCloudModel: Decodable {
    let results: [Results]?
    
    struct Results: Decodable {
        let name: String?
        let url: String?
    }
}
