//
//  CreateCVCell.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class CreateCVCell: UICollectionViewCell {
    
    // MARK: - UI Objects
    lazy var collectionImage: UIImageView = {
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
    
    lazy var addButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("+", for: .normal)
        butt.setTitleColor(.white, for: .normal)
        butt.layer.cornerRadius = 0.5 * butt.bounds.size.width
        butt.backgroundColor = .green
        return butt
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        constrainImage()
        constrainNameLabel()
        constrainAddButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        contentView.addSubview(collectionImage)
        contentView.addSubview(collectionNameLabel)
        contentView.addSubview(addButton)
    }
    
    private func constrainImage() {
        collectionImage.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionImage.topAnchor.constraint(equalTo: contentView.topAnchor), collectionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), collectionImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), collectionImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8)].forEach({$0.isActive = true})
    }
    
    private func constrainNameLabel() {
        collectionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [collectionNameLabel.topAnchor.constraint(equalTo: collectionImage.bottomAnchor), collectionNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), collectionNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), collectionNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)].forEach({$0.isActive = true})
    }
    
    private func constrainAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        [addButton.heightAnchor.constraint(equalTo: collectionImage.heightAnchor, multiplier: 0.25), addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor), addButton.centerXAnchor.constraint(equalTo: collectionImage.centerXAnchor), addButton.centerYAnchor.constraint(equalTo: collectionImage.centerYAnchor)].forEach({$0.isActive = true})
    }
}
