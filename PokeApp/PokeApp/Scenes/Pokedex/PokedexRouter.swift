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
    
    init(view: PokedexViewController) {
        self.view = view
    }
    
    
    func navigateToPokemonDetail(pokemonURL: String) {
        view?.performSegue(withIdentifier: "pokedexToPokemonDetail", sender: nil)
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let pokemonViewController = segue.destination as? PokemonViewController {
            
        }
        
    }
    
    
}
