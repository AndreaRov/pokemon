//
//  CustomSearchBar.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    
    private func setViews() {
        self.backgroundColor = UIColor.clear
        self.backgroundImage = UIImage()
        self.tintColor = Color.granet
        if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.textColor = Color.purple
            textFieldInsideSearchBar.clearButtonMode = UITextField.ViewMode.never
            textFieldInsideSearchBar.layer.borderWidth = 2
            textFieldInsideSearchBar.layer.borderColor = Color.purple.cgColor
            textFieldInsideSearchBar.layer.cornerRadius = 3
        }
    }

}
