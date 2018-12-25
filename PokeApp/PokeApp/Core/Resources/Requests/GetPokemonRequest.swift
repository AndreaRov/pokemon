//
//  GetPokemonRequest.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

class GetPokemonRequest: APIRequestDelegate {
    
    let pokemon:String
    
    init(pokemon: String) {
        self.pokemon = pokemon
    }
    
    typealias Response = [PokemonEntity] //Entity
    
    var resourceName: String {
        let baseURL = "https://pokeapi.co"
        let endPoint = "/api/v2/pokemon/"
        
        return "\(baseURL)\(endPoint)\(pokemon)/"
    }
    
}
