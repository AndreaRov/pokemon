//
//  CustomSearchBar.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureView() {
        if let textFieldUnwrapped = self.value(forKey: "searchField") as? UITextField {
//            textFieldUnwrapped.textColor =
        }
        
    }
    
}
