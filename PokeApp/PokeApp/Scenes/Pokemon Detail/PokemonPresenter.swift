//
//  PokemonPresenter.swift
//  PokeApp
//
//  Created by andrea on 25/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokemonPresenterDelegate {
    func viewIsReady()
}

class PokemonPresenter {
    
    fileprivate weak var view: PokemonViewControllerDelegate?
    private let service: PokemonServiceDelegate
    
    var pokemonURL: String
    
    private var pokemon: PokemonEntity?
    
    init(view: PokemonViewController, service: PokemonService, pokemonURL: String) {
        self.view = view
        self.service = service
        self.pokemonURL = pokemonURL
    }
    
}


extension PokemonPresenter: PokemonPresenterDelegate {
    func viewIsReady() {
        service.getPokemon(resourceName: pokemonURL) { (transaction) in
            
            switch transaction {
                
            case .fail(let error):
                print("Presenter Show Error:",error)
            case .sucess(let data):
                DispatchQueue.main.async {
                    self.pokemon  = data
                    self.view?.setName(name: data.name)
                    self.view?.setImage(urlImageString: data.sprites.front_default)
                    
                    var stringTypes = ""
                    for (index, element) in data.types.enumerated() {
                        if index == data.types.count - 1 {
                            stringTypes += "\(element.type.name)"
                        } else {
                            stringTypes += "\(element.type.name), "
                        }
                    }
                    self.view?.setType(type: stringTypes)
                }
                
            }
            
        }
    }
}

