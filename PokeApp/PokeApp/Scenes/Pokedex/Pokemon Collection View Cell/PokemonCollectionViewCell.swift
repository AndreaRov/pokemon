//
//  PokemonCollectionViewCell.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    static let identifier = "pokemonCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    private func initView() {
        pokemonNameLabel.text = ""
        pokemonNameLabel.textColor = Color.black
    }
    
    
    func setName(name: String) {
        self.pokemonNameLabel.text = name
    }
    

}
