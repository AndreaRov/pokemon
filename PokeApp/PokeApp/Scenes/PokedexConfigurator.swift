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
        
        let router = PokedexRouter(view: pokedexViewController)
        let presenter = PokedexPresenter(view: pokedexViewController, router: router)
        
        pokedexViewController.presenter = presenter
    }
    
}
