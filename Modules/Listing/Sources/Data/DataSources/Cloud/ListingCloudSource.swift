import APIs
import Combine
import Resolver
import AltairMDKProviders

final class ListingCloudSource: ListingCloudSourceProtocol {
    @Injected private var networkProvider: NetworkProviderProtocol
    
    func getPokemonGenerationI<T>() -> AnyPublisher<T, Error> where T: Decodable {
        return networkProvider.agent.run(PokeAPI.pokedexNationalKanto())
    }
    
}
