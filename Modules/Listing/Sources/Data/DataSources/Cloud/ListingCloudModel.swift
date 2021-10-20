struct ListingCloudModel: Decodable {
    let results: [Results]?
    
    struct Results: Decodable {
        let name: String?
        let url: String?
    }
}
