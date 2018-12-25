//
//  PokeAPIManager.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokeAPIManagerDelegate {
    func getPokemonSearch(request: String, completion: @escaping (Transaction<PokemonEntity>) -> Void)
    func getAllPokemonsResults(completion: @escaping (Transaction<[PokemonsResultsEntity]>) -> Void)
    func getPokemon(requestResourceName: String, completion: @escaping (Transaction<PokemonEntity>) -> Void)
}

class PokeAPIManager: PokeAPIManagerDelegate {
    
    func getPokemonSearch(request: String, completion: @escaping (Transaction<PokemonEntity>) -> Void) {
        let request = GetPokemonRequest(pokemon: request)
        
        guard let baseUrlUnwrapped = URL(string: request.resourceName) else {
            completion(Transaction.fail(TransactionError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: baseUrlUnwrapped) { (data, response, error) in
            let jsonDec = JSONDecoder()
            
            if error != nil {
                completion(Transaction.fail(TransactionError.server(message: error.debugDescription)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(Transaction.fail(TransactionError.invalidURL))
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                let pokemon = try? jsonDec.decode(PokemonEntity.self, from: data!)
                
                guard let pokemonUnwrapped = pokemon else {
                    completion(Transaction.fail(TransactionError.decodingError))
                    return
                }
                
                completion(Transaction.sucess(pokemonUnwrapped))
                
            } else {
                print("Status code:",httpResponse.statusCode)
                completion(Transaction.fail(TransactionError.statusCodeProblem))
            }
            
            }.resume()
        
    }
    
    
    func getAllPokemonsResults(completion: @escaping (Transaction<[PokemonsResultsEntity]>) -> Void) {
        let request = GetPokemonsRequest()
        
        guard let baseUrlUnwrapped = URL(string: request.resourceName) else {
            completion(Transaction.fail(TransactionError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: baseUrlUnwrapped) { (data, response, error) in
            let jsonDec = JSONDecoder()
            
            if error != nil {
                completion(Transaction.fail(TransactionError.server(message: error.debugDescription)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(Transaction.fail(TransactionError.invalidURL))
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                let pokemonsEntity = try? jsonDec.decode(PokemonsEntity.self, from: data!)
                
                guard let pokemonsResultsUnwrapped = pokemonsEntity else {
                    completion(Transaction.fail(TransactionError.decodingError))
                    return
                }
                
                let pokemonsResults = pokemonsResultsUnwrapped.results
                
                completion(Transaction.sucess(pokemonsResults))
                
            } else {
                print("Status code:",httpResponse.statusCode)
                completion(Transaction.fail(TransactionError.statusCodeProblem))
            }
            
            }.resume()
    }
    
    
    func getPokemon(requestResourceName: String, completion: @escaping (Transaction<PokemonEntity>) -> Void) {
        
        guard let baseUrlUnwrapped = URL(string: requestResourceName) else {
            completion(Transaction.fail(TransactionError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: baseUrlUnwrapped) { (data, response, error) in
            let jsonDec = JSONDecoder()
            
            if error != nil {
                completion(Transaction.fail(TransactionError.server(message: error.debugDescription)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(Transaction.fail(TransactionError.invalidURL))
                return
            }
            
            if httpResponse.statusCode == 200 {
                
                let pokemon = try? jsonDec.decode(PokemonEntity.self, from: data!)
                
                guard let pokemonUnwrapped = pokemon else {
                    completion(Transaction.fail(TransactionError.decodingError))
                    return
                }
                
                completion(Transaction.sucess(pokemonUnwrapped))
                
            } else {
                print("Status code:",httpResponse.statusCode)
                completion(Transaction.fail(TransactionError.statusCodeProblem))
            }
            
            }.resume()
        
    }
    
    
    
    

}
        
        
        
        

