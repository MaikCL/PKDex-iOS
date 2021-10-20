import Combine
import AltairMDKProviders

protocol ListingCloudSourceProtocol: AnyObject {
    func getPokemonGenerationI<T: Decodable>() -> AnyPublisher<T, Error>
}
