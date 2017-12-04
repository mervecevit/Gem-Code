//
//  ViewController.swift
//  Gem Code
//
//  Created by Emre Özdil on 02/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit
import ZLSwipeableViewSwift
import UIColor_FlatColors
import Cartography

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

var training: Episodes?
var firstStep: Episodes?
var controlStructures: Episodes?

var episodeNumber: Int?
var cardsEpisode: Cards?
class ViewController: UIViewController {
    
    
    var swipeableView: ZLSwipeableView!
    
    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Belize Hole", "Amethyst", "Wisteria", "Wet Asphalt", "Midnight Blue", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Clouds", "Silver", "Concrete", "Asbestos"]
    var colorIndex = 0
    
    var reloadBarButtonItem: UIBarButtonItem!
    // var reloadBarButtonItem = UIBarButtonItem(barButtonSystemItem: "Reload", target: .Plain) { item in }
    var leftBarButtonItem: UIBarButtonItem!
    // var leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: "←", target: .Plain) { item in }
    var upBarButtonItem: UIBarButtonItem!
    // var upBarButtonItem = UIBarButtonItem(barButtonSystemItem: "↑", target: .Plain) { item in }
    var rightBarButtonItem: UIBarButtonItem!
    // var rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: "→", target: .Plain) { item in }
    var downBarButtonItem:UIBarButtonItem!
    // var downBarButtonItem = UIBarButtonItem(barButtonSystemItem: "↓", target: .Plain) { item in }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        view.clipsToBounds = true

        
        swipeableView = ZLSwipeableView()
        view.addSubview(swipeableView)
        swipeableView.didStart = {view, location in
            print("Did start swiping view at location: \(location)")
        }
        swipeableView.swiping = {view, location, translation in
            print("Swiping at view location: \(location) translation: \(translation)")
        }
        swipeableView.didEnd = {view, location in
            print("Did end swiping view at location: \(location)")
        }
        swipeableView.didSwipe = {view, direction, vector in
            print("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        swipeableView.didCancel = {view in
            print("Did cancel swiping view")
        }
        swipeableView.didTap = {view, location in
            print("Did tap at location \(location)")
        }
        swipeableView.didDisappear = { view in
            print("Did disappear swiping view")
        }
        
       
        
        constrain(swipeableView, view) { view1, view2 in
            view1.left == view2.left+50
            view1.right == view2.right-50
            view1.top == view2.top + 120
            view1.bottom == view2.bottom - 100
        }
        
        swipeableView.numberOfActiveView = 1
        swipeableView.numberOfHistoryItem = UInt.max
        
        swipeableView.allowedDirection = Direction.All
        
        let rightBarButtonItemTitle = "↺"
        
        swipeableView.previousView = {
            if let view = self.nextCardView() {
                self.applyRandomTansform(view)
                return view
            }
            return nil
        }
        
        let rBarButtonItem = UIBarButtonItem(title: rightBarButtonItemTitle, style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.rightBarButtonItem = rBarButtonItem
        
        cardsEpisode = stage?.episodes![episodeNumber!]
    }
    
    // MARK: - Actions
    
    @objc func reloadButtonAction() {
        let alertController = UIAlertController(title: nil, message: "Load Cards:", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let ProgrammaticallyAction = UIAlertAction(title: "Programmatically", style: .default) { (action) in
            self.colorIndex = 0
            self.swipeableView.discardViews()
            self.swipeableView.loadViews()
        }
        alertController.addAction(ProgrammaticallyAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func leftButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Left)
    }
    
    @objc func upButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Up)
    }
    
    @objc func rightButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Right)
    }
    
    @objc func downButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Down)
    }
    
    // MARK: ()
    func nextCardView() -> UIView? {
//        swipeableView.numberOfActiveView = UInt(colors.count - colorIndex - 1)
//        swipeableView.numberOfActiveView -= 1
        
//        if colorIndex < 0 {
//            colorIndex = -1
//        }
        if colorIndex == (cardsEpisode?.cards!.count)! - 1 {
            swipeableView.allowedDirection = .None
        } else {
            swipeableView.allowedDirection = .All
        }
        
        if cardsEpisode?.cards![colorIndex].type == "question"{
            let cardView = QuestionCardView(frame: swipeableView.bounds)
            cardView.questionDescriptionLabel.text = cardsEpisode?.cards![colorIndex].text
            cardView.firstButton.setTitle(cardsEpisode?.cards![colorIndex].answers![0], for: .normal)
            cardView.secondButton.setTitle(cardsEpisode?.cards![colorIndex].answers![1], for: .normal)
            cardView.thirdButton.setTitle(cardsEpisode?.cards![colorIndex].answers![2], for: .normal)
            cardView.forthButton.setTitle(cardsEpisode?.cards![colorIndex].answers![3], for: .normal)
            cardView.backgroundColor = UIColor.clear
            colorIndex += 1
            return cardView
        } else if cardsEpisode?.cards![colorIndex].type == "questionWithCode"{
            let cardView = QuestionWithCodeCardView(frame: swipeableView.bounds)
            cardView.codeLabel.text = cardsEpisode?.cards![colorIndex].code
            cardView.questionDescriptionLabel.text = cardsEpisode?.cards![colorIndex].text
            cardView.firstButton.setTitle(cardsEpisode?.cards![colorIndex].answers![0], for: .normal)
            cardView.secondButton.setTitle(cardsEpisode?.cards![colorIndex].answers![1], for: .normal)
            cardView.thirdButton.setTitle(cardsEpisode?.cards![colorIndex].answers![2], for: .normal)
            cardView.forthButton.setTitle(cardsEpisode?.cards![colorIndex].answers![3], for: .normal)
            cardView.backgroundColor = UIColor.clear
            colorIndex += 1
            return cardView
        } else if cardsEpisode?.cards![colorIndex].type == "executor"{
            let cardView = ExecutorCardView(frame: swipeableView.bounds)
            cardView.codeLabel.text = cardsEpisode?.cards![colorIndex].code
            cardView.descriptionLabel.text = cardsEpisode?.cards![colorIndex].text
            cardView.resultLabel.text = cardsEpisode?.cards![colorIndex].result
            cardView.backgroundColor = UIColor.cardColor
            colorIndex += 1
            return cardView
        } else if cardsEpisode?.cards![colorIndex].type == "description"{
            let cardView = DescriptionCardView(frame: swipeableView.bounds)
            cardView.headerLabel.text = cardsEpisode?.cards![colorIndex].header
            cardView.descriptionLabel.text = cardsEpisode?.cards![colorIndex].text
            cardView.backgroundColor = UIColor.cardColor
            colorIndex += 1
            return cardView
        } else if cardsEpisode?.cards![colorIndex].type == "finished"{
            let cardView = FinishCardView(frame: swipeableView.bounds)
            cardView.headerLabel.text = cardsEpisode?.cards![colorIndex].header
            cardView.descriptionLabel.text = cardsEpisode?.cards![colorIndex].text
            cardView.backgroundColor = UIColor.cardColor
            colorIndex += 1
            return cardView
        } else {
            let cardView = DescriptionWithCodeCardView(frame: swipeableView.bounds)
            cardView.headerLabel.text = cardsEpisode?.cards![colorIndex].header
            cardView.codeLabel.text = cardsEpisode?.cards![colorIndex].code
            cardView.descriptionLabel.text = cardsEpisode?.cards![colorIndex].text
            cardView.backgroundColor = UIColor.cardColor
            colorIndex += 1
            return cardView
        }
        
        
    }
    
    func colorForName(_ name: String) -> UIColor {
        let sanitizedName = name.replacingOccurrences(of: " ", with: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.perform(Selector(selector)).takeUnretainedValue() as! UIColor
    }
    
    
    @objc func handleAnswer() {
        
    }

    
    func applyRandomTansform(_ view: UIView) {
        let width = swipeableView.bounds.width
        let height = swipeableView.bounds.height
        let distance = max(width, height)
        
        func randomRadian() -> CGFloat {
            return CGFloat(arc4random() % 360)  * CGFloat(Double.pi / 180)
        }
        
        var transform = CGAffineTransform(rotationAngle: randomRadian())
        transform = transform.translatedBy(x: distance, y: 0)
        transform = transform.rotated(by: randomRadian())
        view.transform = transform
    }
    
    // MARK: - Actions
    
    @objc func rightBarButtonClicked() {
        if colorIndex != 1 {
            self.swipeableView.rewind()
            swipeableView.allowedDirection = .All
            colorIndex -= 1
        }
    }
}
