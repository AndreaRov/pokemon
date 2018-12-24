//
//  PokedexPresenter.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokedexPresenterDelegate {
    func viewIsReady()
    func searchPokemon(pokemon: String)
    func getTotalPokemonsCount() -> Int
    func getPokemonName(row: Int) -> String
    func getPokemonImageURL(row: Int) -> String
}

final class PokedexPresenter {
    
    fileprivate weak var view: PokedexViewControllerDelegate?
    private var router: PokedexRouterDelegate
    private let service: PokemonServiceDelegate
    
    var arrPokemon = [PokemonEntity]()
    
    init(view: PokedexViewController, router: PokedexRouter, service: PokemonService) {
        self.view = view
        self.router = router
        self.service = service
    }
    
}


extension PokedexPresenter: PokedexPresenterDelegate {
    
    func viewIsReady() {
        
    }
    
    
    func searchPokemon(pokemon: String) {
        service.searchPokemon(pokemon: pokemon) { (transaction) in
        
            switch transaction {
                
            case .fail(let error):
                print("Presenter Show Error:",error)
                DispatchQueue.main.async {
                    self.arrPokemon.removeAll()
                    self.view?.reloadPokemonData()
                }
            case .sucess(let data):
                DispatchQueue.main.async {
                    self.arrPokemon = [data]
                    self.view?.reloadPokemonData()
                }
                
            }
            
        }
        
    }
    
    
    func getTotalPokemonsCount() -> Int {
        return arrPokemon.count
    }
    
    func getPokemonName(row: Int) -> String {
        return arrPokemon[row].name
    }
    
    func getPokemonImageURL(row: Int) -> String {
        return arrPokemon[row].sprites.front_default
    }
    
}


