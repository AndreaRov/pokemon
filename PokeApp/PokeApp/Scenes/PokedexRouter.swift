//
//  PokedexRouter.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokedexRouterDelegate {
    
}

final class PokedexRouter: PokedexRouterDelegate {
    
    fileprivate weak var view: PokedexViewControllerDelegate?
    
    init(view: PokedexViewController) {
        self.view = view
    }
    
    
    
}
