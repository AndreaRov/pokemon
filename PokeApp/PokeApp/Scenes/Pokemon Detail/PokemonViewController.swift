//
//  PokemonViewController.swift
//  PokeApp
//
//  Created by andrea on 25/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var pokemonSearchBar: CustomSearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func configureView() {
        
    }

    
    //MARK: - Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            let pokemon = searchText.lowercased()
            //TODO - Search pokemon
//            presenter.searchPokemon(pokemon: pokemon)
        }
    }
    
    
}



//  func searchPokemon(pokemon: String)
