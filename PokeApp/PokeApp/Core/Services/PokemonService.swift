//
//  PokemonUseCase.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokemonServiceDelegate {
    func searchPokemon(pokemon: String, completion: @escaping (Transaction<PokemonEntity>) -> Void)
    func getAllPokemons(completion: @escaping (Transaction<[PokemonsResultsEntity]>) -> Void)
    func getPokemonImageUrl(requestResourceName: String, completion: @escaping (Transaction<String>) -> Void)
}

class PokemonService: PokemonServiceDelegate {
    
    let network: PokeAPIManagerDelegate

    init(network: PokeAPIManager) {
        self.network = network
    }
    
    func searchPokemon(pokemon: String, completion: @escaping (Transaction<PokemonEntity>) -> Void) {
        
        network.getPokemonSearch(pokemon: pokemon) { (transaction) in
            
            switch transaction {
            case .sucess(let data):
                completion(Transaction.sucess(data))
            case .fail(let error):
                completion(Transaction.fail(error))
            }
            
        }
        
    }
    
    
    func getAllPokemons(completion: @escaping (Transaction<[PokemonsResultsEntity]>) -> Void) {
        
        network.getAllPokemonsResults(completion: { (transaction) in
            
            switch transaction {
            case .sucess(let data):
                completion(Transaction.sucess(data))
            case .fail(let error):
                completion(Transaction.fail(error))
            }
            
        })
    }
    
    func getPokemonImageUrl(requestResourceName: String, completion: @escaping (Transaction<String>) -> Void) {
        
        network.getPokemon(requestResourceName: requestResourceName) { (transaction) in
            
            switch transaction {
            case .sucess(let data):
                completion(Transaction.sucess(data.sprites.front_default))
            case .fail(let error):
                completion(Transaction.fail(error))
            }
            
        }
        
        
        
    }
    
}
