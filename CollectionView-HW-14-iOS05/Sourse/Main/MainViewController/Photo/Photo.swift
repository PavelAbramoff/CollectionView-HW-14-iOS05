//
//  Photo.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

class MainAllPhotos: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    static let identifier = "MainAllPhotos"
  
    @objc func selectButtonItem(param: UIBarButtonItem) {
    }
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return collectionView
    }()
    
    private let subView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        
        label.text = "Недавние"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayouts()
        setupView()
        setupDelegates()
        setupCollectionView()
        collectionView.reloadData()
    }
    
    // MARK: - Private functions
    
    private func setupHierarchy() {
        view.addSubview(subView)
        subView.addSubview(collectionView)
        subView.addSubview(label)
    }
    
    private func setupLayouts() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        subView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        subView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
        label.leadingAnchor.constraint(equalTo: subView.leadingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: subView.topAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                                           target: self,
                                                           action: #selector(selectButtonItem(param:)) )
    }
    
    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupCollectionView() {
      
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as! MainCollectionViewCell
            cell.contentView.backgroundColor = .green
            return cell
    }
}

