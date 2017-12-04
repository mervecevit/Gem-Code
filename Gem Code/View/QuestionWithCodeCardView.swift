//
//  QuestionWithCodeCard.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class QuestionWithCodeCardView: UIView {
    
    let codeLabel: UILabel = {
        let label = UILabel()
        label.text = "print(champion)"
        label.textColor = UIColor.codeText
        label.backgroundColor = UIColor.codeBackground
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return label
    }()
    
    let questionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "What will be the result of the code?"
        label.textColor = UIColor.background
        label.backgroundColor = UIColor.cardColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let firstButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 0
        button.setTitle("ERROR", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.cardColor
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let secondButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 1
        button.setTitle("Champion", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.cardColor
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let thirdButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 2
        button.setTitle("champion", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.cardColor
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return button
    }()
    
    let forthButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 3
        button.setTitle("print(champion)", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.cardColor
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
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
        
        addSubview(codeLabel)
        addSubview(questionDescriptionLabel)
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        addSubview(forthButton)
        
        setupCodeLabel()
        setupQuestionDescriptionLabel()
        setupFirstButton()
        setupSecondButton()
        setupThirdButton()
        setupForthButton()
    }
    
    func setupCodeLabel() {
        codeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        codeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        codeLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        codeLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setupQuestionDescriptionLabel() {
        questionDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionDescriptionLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor, constant: 24).isActive = true
        questionDescriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        questionDescriptionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func setupFirstButton() {
        firstButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: questionDescriptionLabel.bottomAnchor, constant: 24).isActive = true
        firstButton.widthAnchor.constraint(equalTo: codeLabel.widthAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setupSecondButton() {
        secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 16).isActive = true
        secondButton.widthAnchor.constraint(equalTo: codeLabel.widthAnchor).isActive = true
//        secondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setupThirdButton() {
        thirdButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 16).isActive = true
        thirdButton.widthAnchor.constraint(equalTo: codeLabel.widthAnchor).isActive = true
        thirdButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    func setupForthButton() {
        forthButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        forthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 16).isActive = true
        forthButton.widthAnchor.constraint(equalTo: codeLabel.widthAnchor).isActive = true
        forthButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    @objc func handleAnswer(sender: ChoiceButton) {
        print(sender.choiceValue)
    }
}


