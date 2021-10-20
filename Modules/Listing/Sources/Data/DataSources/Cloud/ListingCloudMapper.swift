import AltairMDKCommon

class ListingCloudMapper: EntityFailableMapper {
    typealias Model = ListingCloudModel
    typealias Entity = [Pokemon]
    
    static var mapModelToEntity: (ListingCloudModel) throws -> [Pokemon] = { model in
        let regexPattern = "(?<=pokemon/)[^/]+"
        guard let results = model.results else { throw MapperException.cantMapToEntity }
        return results.compactMap { result -> Pokemon? in
            guard let id = Int(Regex.matches(for: regexPattern, in: result.url ?? "").first ?? "") else { return nil }
            guard let name = result.name else { return nil }
            return Pokemon(id: id, name: name)
        }
    }
    
}
