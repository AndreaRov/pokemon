//
//  PokedexViewController.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

protocol PokedexViewControllerDelegate: class {
    func reloadPokemonData()
}

final class PokedexViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var configurator = PokedexConfigurator()
    var presenter: PokedexPresenterDelegate!
    
    @IBOutlet weak var pokemonSearchBar: CustomSearchBar!
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    //MARK: - View Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(pokedexViewController: self)
        configureView()
        presenter.viewIsReady()
    }
    
    private func configureView() {
        hideKeyboardWhenTappedAround()
        setDelegates()
        setTextValues()
        registerCell()
    }
    
    private func setDelegates() {
        pokemonSearchBar.delegate = self
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
    }
    
    private func setTextValues() {
        pokemonSearchBar.placeholder = "Busca un pokemon"
    }
    
    private func registerCell() {
        pokemonCollectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
    }
    
    //MARK: - Search Bar

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            let pokemon = searchText.lowercased()
            //TODO - Search pokemon
            presenter.searchPokemon(pokemon: pokemon)
        }
    }
    
    
    //MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getTotalPokemonsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell {
            
            cell.setName(name: presenter.getPokemonName(row: indexPath.row))
            cell.setImage(urlString: presenter.getPokemonImageURL(row: indexPath.row))
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}


extension PokedexViewController: PokedexViewControllerDelegate {
    
    func reloadPokemonData() {
        pokemonCollectionView.reloadData()
    }
    
}
