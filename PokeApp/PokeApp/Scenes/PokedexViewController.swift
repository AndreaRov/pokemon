//
//  PokedexViewController.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var pokemonSearchBar: CustomSearchBar!
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    //MARK: - View Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        setDelegates()
        setTextValues()
        registerCell()
    }
    
    private func setDelegates() {
        pokemonSearchBar.delegate = self
        pokemonCollectionView.delegate = self
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
        }
    }
    
    
    //MARK: - Collection View
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell {
            cell.pokemonNameLabel.text = "Prueba"
            if indexPath.row == 1 {
                print()
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
