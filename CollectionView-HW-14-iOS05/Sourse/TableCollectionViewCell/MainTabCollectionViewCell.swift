//
//  MainTabCollectionViewCell.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

class MainTableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainTableCollectionViewCell"
    
    // MARK: - Elements
    
    public let iconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    public let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    public var arrawContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    public let arrawImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    public let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 22)
        label.numberOfLines = 1
        
        return label
    }()
    
    public let labelLeft: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        return label
    }()
    
    private let stripeView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupHierarchy()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(labelLeft)
        contentView.addSubview(arrawContainer)
        contentView.addSubview(stripeView)
        arrawContainer.addSubview(arrawImageView)
        iconContainer.addSubview(iconImageView)
        
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
    }
    
    private func setupLayouts() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        arrawContainer.translatesAutoresizingMaskIntoConstraints = false
        arrawImageView.translatesAutoresizingMaskIntoConstraints = false
        labelLeft.translatesAutoresizingMaskIntoConstraints = false
        stripeView.translatesAutoresizingMaskIntoConstraints = false
     
        NSLayoutConstraint.activate([
        label.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: -5),
        label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        
        iconContainer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        iconContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
        iconContainer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
        iconContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
        
        iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
        iconImageView.widthAnchor.constraint(equalTo:iconContainer.widthAnchor, constant: -24),
        iconImageView.heightAnchor.constraint(equalTo:iconContainer.heightAnchor, constant: -24),
        
        arrawContainer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        arrawContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
        arrawContainer.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
        arrawContainer.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
        
        arrawImageView.centerYAnchor.constraint(equalTo: arrawContainer.centerYAnchor),
        arrawImageView.trailingAnchor.constraint(equalTo: arrawContainer.trailingAnchor, constant: -8),
        arrawImageView.widthAnchor.constraint(equalTo: arrawContainer.widthAnchor, constant: -34),
        arrawImageView.heightAnchor.constraint(equalTo: arrawContainer.widthAnchor, constant: -34),
        
        labelLeft.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        labelLeft.trailingAnchor.constraint(equalTo: arrawImageView.leadingAnchor, constant: -5),

        stripeView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
        stripeView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 1000),
        stripeView.leadingAnchor.constraint(equalTo: label.leadingAnchor),
        stripeView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        iconImageView.image = nil
        labelLeft.text = nil
        arrawImageView.image = nil
        
        stripeView.backgroundColor = .systemGray4
        
    }
    
    // MARK: - Configure cell
    
    func configure(with model: TableOption) {
        label.text = model.title
        iconImageView.image = model.icon
        labelLeft.text = String(model.label)
        arrawImageView.image = UIImage(systemName: "chevron.right")
        
        switch model.title {
        case "Анимированные":
            stripeView.backgroundColor = .clear
        case "Недавно удаленные":
            stripeView.backgroundColor = .clear
        default:
            stripeView.backgroundColor = .systemGray4
        }
    }
    
    
}

