//
//  Created by Miguel Angel on 06-07-20.
//

import AltairMDKProviders

public enum PokeAPI {
    private static let baseUrl = "https://pokeapi.co/api/v2"
    
    private static let defaultHeaders = [
        "Content-Type": "application/json",
        "cache-control": "no-cache"
    ]
    
    public static func pokedexNationalKanto<APIResponse>() -> Endpoint<APIResponse> {
        return Endpoint<APIResponse>(headers: defaultHeaders, method: .get, path: baseUrl + "/pokemon?limit=151")
    }
}
