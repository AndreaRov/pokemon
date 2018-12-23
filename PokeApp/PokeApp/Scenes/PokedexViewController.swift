//
//  PokedexViewController.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var pokemonSearchBar: CustomSearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        pokemonSearchBar.delegate = self
        pokemonSearchBar.placeholder = "Busca un pokemon"
    }
    
    
    //MARK: - Search Bar Delegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            let pokemon = searchText.lowercased()
            //TODO - Search pokemon
        }
    }
    
    
    
}
