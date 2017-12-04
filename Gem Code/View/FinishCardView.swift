//
//  FinishCardView.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class FinishCardView: UIView {
    
    var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.codeText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Congratulations!"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.codeBackground
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.codeText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "You learned to use print() function! Bravo champion!"
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
    
    let nextEpisodeButton: UIButton = {
        let button = ChoiceButton()
        button.choiceValue = 0
        button.backgroundColor = UIColor.background
        button.layer.cornerRadius = 15
        button.setTitle("Next Episode", for: .normal)
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
        
        
        addSubview(lineView)
        addSubview(headerLabel)
        addSubview(line)
        addSubview(descriptionLabel)
        addSubview(nextEpisodeButton)
        
        setupLineView()
        setupHeaderLabel()
        setupLine()
        setupDescriptionLabel()
        setupNextEpisodeButton()
    }
    func setupLineView(){
        lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        lineView.widthAnchor.constraint(equalTo: headerLabel.widthAnchor, constant: -64).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupHeaderLabel() {
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 8).isActive = true
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
    
    func setupNextEpisodeButton() {
        nextEpisodeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextEpisodeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32).isActive = true
        nextEpisodeButton.widthAnchor.constraint(equalTo: descriptionLabel.widthAnchor).isActive = true
        nextEpisodeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleAnswer(sender: ChoiceButton) {

    }
    
}


