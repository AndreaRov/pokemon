//
//  PokemonEntity.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

struct PokemonEntity: Codable {
    let name: String
    let sprites: [PokemonSpritesEntity]
}
