//
//  ViewController.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

class MainViewController: UIViewController,
                          UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .albumsCell(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
                cell.configure(with: model)
                cell.contentView.backgroundColor = .clear
                return cell
        case .standardCell(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainTableCollectionViewCell.identifier, for: indexPath) as! MainTableCollectionViewCell
            cell.configure(with: model)
            cell.contentView.backgroundColor = .clear
            return cell
        }
    }
    
    
    var models = [Models]()
    
    @objc func leftButtonItem(param: UIBarButtonItem) {
        
    }
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return collectionView
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

