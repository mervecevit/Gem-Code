//
//  DescriptionWithCodeViwe.swift
//  Gem Code
//
//  Created by Merve Ecevit on 3/12/17.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class DescriptionWithCodeCardView: UIView {
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.text = "print(champion)"
        label.textColor = UIColor.codeText
        label.backgroundColor = UIColor.codeBackground
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return label
    }()
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.codeText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Instructions"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Champion! Follow my lead to learn Python."
        label.layer.masksToBounds = true
        label.adjustsFontSizeToFitWidth = true
        label.layer.cornerRadius = 15
        label.textColor = UIColor.codeBackground
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        // Shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        // Corner Radius
        layer.cornerRadius = 10.0;
        
        addSubview(headerLabel)
        addSubview(line)
        addSubview(descriptionLabel)
        addSubview(codeLabel)
        
        setupHeaderLabel()
        setupLine()
        setupDescriptionLabel()
        setupCodeLabel()
    }
    
    func setupHeaderLabel() {
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupLine() {
        line.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        line.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8).isActive = true
        line.widthAnchor.constraint(equalTo: headerLabel.widthAnchor, constant: -64).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: headerLabel.widthAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupCodeLabel(){
        codeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        codeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8).isActive = true
        codeLabel.widthAnchor.constraint(equalTo: headerLabel.widthAnchor).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}

