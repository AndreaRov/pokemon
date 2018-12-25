//
//  PokedexPresenter.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokedexPresenterDelegate {
    var router: PokedexRouterDelegate { get }
    
    func viewIsReady()
    func getTotalPokemonsCount() -> Int
    func getPokemonName(row: Int) -> String
    func didSelectItemAt(row: Int)
}

final class PokedexPresenter {
    
    fileprivate weak var view: PokedexViewControllerDelegate?
    internal var router: PokedexRouterDelegate
    private let service: PokemonServiceDelegate
    
    var arrPokemons = [PokemonsResultsEntity]()
    
    init(view: PokedexViewController, router: PokedexRouter, service: PokemonService) {
        self.view = view
        self.router = router
        self.service = service
    }
    
}


extension PokedexPresenter: PokedexPresenterDelegate {
    
    func viewIsReady() {
        service.getAllPokemons { (transaction) in
            
            switch transaction {
                
            case .fail(let error):
                print("Presenter Show Error:",error)
            case .sucess(let data):
                DispatchQueue.main.async {
                    self.arrPokemons = data
                    self.view?.reloadPokemonData()
                }
                
            }
            
        }
    }
    
    
    func getTotalPokemonsCount() -> Int {
        return arrPokemons.count
    }
    
    func getPokemonName(row: Int) -> String {
        return arrPokemons[row].name
    }
    
    func didSelectItemAt(row: Int) {
        router.navigateToPokemonDetail(pokemonURL: arrPokemons[row].url)
    }
    
}


