//
//  PokedexPresenter.swift
//  PokeApp
//
//  Created by andrea on 24/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import Foundation

protocol PokedexPresenterDelegate {
    func viewIsReady()
}

final class PokedexPresenter {
    
    fileprivate weak var view: PokedexViewControllerDelegate?
    private var router: PokedexRouterDelegate
    
    init(view: PokedexViewController, router: PokedexRouter) {
        self.view = view
        self.router = router
    }
    
}


extension PokedexPresenter: PokedexPresenterDelegate {
    
    func viewIsReady() {
        
    }
    
}

