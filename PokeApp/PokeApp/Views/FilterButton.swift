//
//  FilterButton.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class FilterButton: UIButton {
    
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    
    static private let nibName = "FilterButton"

    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    private func setViews() {
        filterLabel.text = ""
        filterLabel.textColor = Color.black
        selectedView.backgroundColor = Color.white
    }
    
    func setSelected(selected: Bool) {
        if isSelected {
            selectedView.backgroundColor = Color.purple
        } else {
            selectedView.backgroundColor = Color.white
        }
    }

}
