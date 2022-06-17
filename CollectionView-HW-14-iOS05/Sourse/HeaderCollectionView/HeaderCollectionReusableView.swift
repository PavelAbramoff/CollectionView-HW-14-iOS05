//
//  HeaderCollectionReusableView.swift
//  CollectionView-HW-14-iOS05
//
//  Created by Pavel Абрамов on 15.06.2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"

    // MARK: - Elements
    
    private var leftLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        
        return label
    }()

    private  var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .right
        
        return label
    }()
    
    private let stripeView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    // MARK: - Configure Header

    public func configureBothHeaders(leftheader: String, rightHeader: String) {
        leftLabel.text = leftheader
        rightLabel.text = rightHeader
        addSubview(leftLabel)
        addSubview(rightLabel)
        addSubview(stripeView)
    }

    public func configureLeftHeader(_ leftheader: String) {
        leftLabel.text = leftheader
        rightLabel.text = ""
        addSubview(leftLabel)
        addSubview(rightLabel)
        addSubview(stripeView)
    }
    
    // MARK: - Setup constraints
        
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear

        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        stripeView.translatesAutoresizingMaskIntoConstraints = false

        
        
        NSLayoutConstraint.activate([

        leftLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        leftLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),

        rightLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        rightLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
        
        stripeView.bottomAnchor.constraint(equalTo: leftLabel.topAnchor, constant: -5),
        stripeView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 1000),
        stripeView.leadingAnchor.constraint(equalTo: leftLabel.leadingAnchor),
        stripeView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

