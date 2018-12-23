//
//  FilterButton.swift
//  PokeApp
//
//  Created by andrea on 23/12/2018.
//  Copyright © 2018 andrea. All rights reserved.
//

import UIKit

class FilterButton: UIButton {
    
    @IBOutlet weak var selectedView: UIView!
    
    private var filterButtonIsPressed = false {
        didSet {
            setSelectedView(selected: filterButtonIsPressed)
        }
    }
    
    static private let nibName = "FilterButton"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadViewFromNib(nibName: FilterButton.nibName)
        setViews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        loadViewFromNib(nibName: FilterButton.nibName)
        setViews()
    }
    
    private func setViews() {
        self.setTitle("FILTER", for: .normal)
        self.setTitleColor(Color.black, for: .normal)
        self.titleLabel?.font = UIFont(name: "Menlo", size: 16)
        selectedView.backgroundColor = Color.white
    }
    
    private func setSelectedView(selected: Bool) {
        if selected {
            selectedView.backgroundColor = Color.purple
        } else {
            selectedView.backgroundColor = Color.white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        filterButtonIsPressed = !filterButtonIsPressed
    }

}
