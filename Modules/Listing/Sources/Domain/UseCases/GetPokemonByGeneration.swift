import Combine
import Resolver
import AltairMDKCommon

final class GetPokemonByGeneration: GetPokemonByGenerationProtocol {
    @Injected private var listingRepo: ListingRepositoryProtocol
    
    func execute(generation: PokemonGeneration) -> AnyPublisher<[Pokemon], Error> {
        switch generation {
            case .generationI:
                return listingRepo.getPokemonGenerationI().tryMap {
                    if $0.isEmpty {
                        throw ListingException.noResults
                    } else {
                        return $0
                    }
                }.eraseToAnyPublisher()
        }
    }
}
