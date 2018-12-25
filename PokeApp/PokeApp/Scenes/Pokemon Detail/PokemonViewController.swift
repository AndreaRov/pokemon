//
//  PokemonViewController.swift
//  PokeApp
//
//  Created by andrea on 25/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

protocol PokemonViewControllerDelegate: class {
    func setName(name: String)
    func setImage(urlImageString: String)
    func setType(type: String)
}

class PokemonViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var typeTitleLabel: UILabel!
    @IBOutlet weak var typePokemonLabel: UILabel!
    
    var configurator: PokemonConfigurator!
    var presenter: PokemonPresenterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(pokemonViewController: self)
        configureView()
        presenter.viewIsReady()
        
    }
    
    private func configureView() {
        pokemonName.text = ""
        typePokemonLabel.text = ""
        typeTitleLabel.text = "Tipo: "
    }
    
}

extension PokemonViewController: PokemonViewControllerDelegate {
    
    func setName(name: String) {
        self.pokemonName.text = name
    }
    
    func setImage(urlImageString: String) {
        pokemonImageView.imageFromServerURL(urlImageString, imagePlaceHolder: UIImage())
    }
    
    func setType(type: String) {
        typePokemonLabel.text = type
    }

}
