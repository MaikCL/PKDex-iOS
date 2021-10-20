import Resolver
import AltairMDKCommon
import AltairMDKProviders

final public class DIComponents {
    
    public static func bind() {
        
        // MARK: Data layer components
        Resolver.register { NetworkProvider(strategy: .nsUrlSession) }.implements(NetworkProviderProtocol.self)
        Resolver.register { ListingCloudSource() }.implements(ListingCloudSourceProtocol.self)
        Resolver.register { ListingRepository() }.implements(ListingRepositoryProtocol.self)
        Resolver.register { ListingCloudMapper.mapModelToEntity }
        
        // MARK: Domain layer components
        Resolver.register { GetPokemonByGeneration() }.implements(GetPokemonByGenerationProtocol.self)

        // MARK: Presentation layer components
        Resolver.register { PokemonMapper.mapEntityToModel }
        Resolver.register {
            Store<ListingState, ListingAction>(
                state: .initial,
                reducer: ListingReducer.reduce(state:action:),
                sideEffects: [
                    ListingSideEffects.whenSearchPokemon()
                ])
        }

    }

}
