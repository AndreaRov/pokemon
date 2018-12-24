//
//  PokemonCollectionViewCell.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    static let identifier = "pokemonCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    private func initView() {
        pokemonImageView.image = UIImage()
        pokemonNameLabel.text = ""
        pokemonNameLabel.textColor = Color.black
    }
    
    
    func setName(name: String) {
        self.pokemonNameLabel.text = name
    }
    
    func setImage(urlString: String) {
        self.pokemonImageView.imageFromServerURL(urlString, imagePlaceHolder: UIImage())
    }
    
    

}
