//
//  MainCollectionViewCell.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    // MARK: - Configure Cell
    
    func configure(with model: ItemOption) {
        profileImageView.image = UIImage(named: model.imageName)
        name.text = model.name
        number.text = String(model.number)
    }

    // MARK: - Elements
    
     let profileImageView: UIImageView = {
         let imageView = UIImageView()
         imageView.layer.masksToBounds = true
         imageView.layer.cornerRadius = 8
         imageView.backgroundColor = .clear
         return imageView
    }()

    let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    let number: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private let selectView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) - fatalError")
    }
    
    // MARK: - Settings
    
    private func setupViews() {
        contentView.clipsToBounds = true
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(name)
        contentView.addSubview(number)
        contentView.addSubview(selectView)
    }
    
    private func setupLayouts() {
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        number.translatesAutoresizingMaskIntoConstraints = false
        selectView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
            
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,constant: 10),
            
            number.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            number.topAnchor.constraint(equalTo: name.bottomAnchor),
            
            selectView.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            selectView.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor),
            selectView.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            selectView.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor)
        ])
    }
    
    func changeSelect(color: UIColor?) {
        selectView.backgroundColor = color
    }
}
