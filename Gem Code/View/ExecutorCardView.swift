//
//  ExecutorCardLabel.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

//
//  DescriptionCardView.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class ExecutorCardView: UIView {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "print() function used for writing to the screen. Champion will be written to screen."
        label.textColor = UIColor.codeBackground
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "champion"
        label.textColor = UIColor.codeText
        label.backgroundColor = UIColor.codeBackground
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = UIFont.systemFont(ofSize: 15)
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return label
    }()
    
    let runButton: UIButton = {
        let button = ChoiceButton()
        button.choiceValue = 0
        button.backgroundColor = UIColor.background
        button.setTitle("Run", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor.cardColor, for: .normal)
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        addSubview(descriptionLabel)
        addSubview(codeLabel)
        addSubview(resultLabel)
        addSubview(runButton)
        
        setupDescriptionLabel()
        setupCodeLabel()
        setupResultLabel()
        setupRunButton()
    }
    
    
    func setupDescriptionLabel() {
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupCodeLabel() {
        codeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        codeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24).isActive = true
        codeLabel.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor).isActive = true
        codeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupResultLabel() {
        resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 16).isActive = true
        resultLabel.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupRunButton() {
        runButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        runButton.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 126).isActive = true
        runButton.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor).isActive = true
        runButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleAnswer(sender: ChoiceButton) {
        resultLabel.isHidden = false
    }
    
}


