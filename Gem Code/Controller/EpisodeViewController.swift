//
//  EpisodeViewController.swift
//  Gem Code
//
//  Created by Emre Özdil on 03/12/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//
import UIKit

var stageType: Int?
var stage: Episodes?

class EpisodeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.background
        collectionView?.register(EpisodeCell.self, forCellWithReuseIdentifier: cellId)
        
        if stageType == 0 {
            stage = training
            title = "Training"
        } else if stageType == 1 {
            stage = firstStep
            title = "First Step"
        } else {
            stage = controlStructures
            title = "Control Structures"
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EpisodeCell
        cell.nameLabel.text = "\(indexPath.item + 1)"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if let count = stage?.episodes?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        episodeNumber = indexPath.item
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView?.frame.width)!/5, height: (self.collectionView?.frame.width)!/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 100, left: 50, bottom: 0, right: 50)
    }

}

class EpisodeCell: UICollectionViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.textColor = UIColor.background
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 1
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor.cardColor
        layer.masksToBounds = true
        layer.cornerRadius = 15
        addSubview(nameLabel)
        nameLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
    }
}


