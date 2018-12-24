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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - View
    
    private func configureView() {
        pokemonSearchBar.delegate = self
        pokemonSearchBar.placeholder = "Busca un pokemon"
        
        registerCellTypes()
    }
    
    
    private func registerCellTypes() {
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell {
            
        }
        return UICollectionViewCell()
    }
    
    
}
