//
//  PokedexConfigurator.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

final class PokedexConfigurator {
    
    func configure(pokedexViewController: PokedexViewController) {
        let pokeApi = PokeAPIManager()
        let service = PokemonService(network: pokeApi)
        let router = PokedexRouter(view: pokedexViewController)
        let presenter = PokedexPresenter(view: pokedexViewController, router: router, service: service)
        pokedexViewController.presenter = presenter
    }
    
}
