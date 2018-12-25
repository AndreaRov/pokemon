//
//  PokedexRouter.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

protocol PokedexRouterDelegate {
    func navigateToPokemonDetail(pokemonURL: String)
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

final class PokedexRouter: PokedexRouterDelegate {
    
    fileprivate weak var view: PokedexViewControllerDelegate?
    
    var pokemonURL: String?
    
    init(view: PokedexViewController) {
        self.view = view
    }
    
    
    func navigateToPokemonDetail(pokemonURL: String) {
        self.pokemonURL = pokemonURL
        if let _ = self.pokemonURL {
            view?.performSegue(withIdentifier: "pokedexToPokemonDetail", sender: nil)
        }
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let pokemonViewController = segue.destination as? PokemonViewController,
            let pokemonUrlUnwrapped = self.pokemonURL {
            
            pokemonViewController.configurator = PokemonConfigurator(pokemonURL: pokemonUrlUnwrapped)
        }
        
    }
    
    
}
