//
//  CardView.swift
//  Gem Code
//
//  Created by Emre Özdil on 02/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

protocol QuestionCardViewDelegate : class{
    func leftButtonAction()
}

class QuestionCardView: UIView {
    var delegate: QuestionCardViewDelegate?
    
    var viewController: ViewController?
    var correctAnswerIndex: Int?
    
    let questionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "What does print() function do?"
        label.adjustsFontSizeToFitWidth = true
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
        button.backgroundColor = UIColor.cardColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.setTitle("Indicates the meaning of the codes.", for: .normal)
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let secondButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 1
        button.backgroundColor = UIColor.cardColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.setTitle("Indicates the output of codes.", for: .normal)
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let thirdButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 2
        button.backgroundColor = UIColor.cardColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.setTitle("Used for displaying data on the screen.", for: .normal)
        button.addTarget(self, action: #selector(handleAnswer), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let forthButton: ChoiceButton = {
        let button = ChoiceButton()
        button.choiceValue = 3
        button.backgroundColor = UIColor.cardColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitleColor(UIColor.codeBackground, for: .normal)
        button.setTitle("Shows codes on the screen.", for: .normal)
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
        
        addSubview(questionDescriptionLabel)
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        addSubview(forthButton)

        setupQuestionDescriptionLabel()
        setupFirstButton()
        setupSecondButton()
        setupThirdButton()
        setupForthButton()
    }
    
    func setupQuestionDescriptionLabel() {
        questionDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionDescriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        questionDescriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        questionDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func setupFirstButton() {
        firstButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: questionDescriptionLabel.bottomAnchor, constant: 24).isActive = true
        firstButton.widthAnchor.constraint(equalTo: questionDescriptionLabel.widthAnchor).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupSecondButton() {
        secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 16).isActive = true
        secondButton.widthAnchor.constraint(equalTo: questionDescriptionLabel.widthAnchor).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupThirdButton() {
        thirdButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 16).isActive = true
        thirdButton.widthAnchor.constraint(equalTo: questionDescriptionLabel.widthAnchor).isActive = true
        thirdButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    func setupForthButton() {
        forthButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        forthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 16).isActive = true
        forthButton.widthAnchor.constraint(equalTo: questionDescriptionLabel.widthAnchor).isActive = true
        forthButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleAnswer(sender: ChoiceButton) {
        if sender.choiceValue != correctAnswerIndex {
            let alert = UIAlertController(title: "Wrong Answer", message: "Please try again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.window?.rootViewController?.dismiss(animated: true, completion: nil)
            })
            alert.addAction(action)
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Correct Answer", message: "Keep going!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                self.window?.rootViewController?.swipeableView.swipeTopView(inDirection: .Left)
//                delegate.lef
//                self.window?.rootViewController?.dismiss(animated: true, completion: nil)
                self.delegate?.leftButtonAction()
                
            })
            alert.addAction(action)
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

class ChoiceButton : UIButton {
    var choiceValue : Int = -1
}
