//
//  PokemonConfigurator.swift
//  PokeApp
//
//  Created by andrea on 25/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

class PokemonConfigurator {
    
    var pokemonURL: String
    
    init(pokemonURL: String) {
        self.pokemonURL = pokemonURL
    }
    
    func configure(pokemonViewController: PokemonViewController) {
        let nerwork = PokeAPIManager()
        let service = PokemonService(network: nerwork)
        let presenter = PokemonPresenter(view: pokemonViewController, service: service, pokemonURL: pokemonURL)
        pokemonViewController.presenter = presenter
    }
}
