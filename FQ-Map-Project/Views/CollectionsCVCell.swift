//
//  CollectionsCVCell.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/7/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class CollectionsCVCell: UICollectionViewCell {
    
    // MARK: - UI Objects
    lazy var venueImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .brown
        return img
    }()
    
    lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "Hello"
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        constrainImageView()
        constrainNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        contentView.addSubview(venueImage)
        contentView.addSubview(collectionNameLabel)
    }
    
    // MARK: - Constraint Methods
    private func constrainImageView() {
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        
        [venueImage.topAnchor.constraint(equalTo: contentView.topAnchor), venueImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), venueImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), venueImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85)].forEach({$0.isActive = true})
    }
    
    private func constrainNameLabel() {
        collectionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionNameLabel.topAnchor.constraint(equalTo: venueImage.bottomAnchor), collectionNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), collectionNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), collectionNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)].forEach({$0.isActive = true})
    }
}
