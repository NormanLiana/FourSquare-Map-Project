//
//  VenueImageCVCell.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/5/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class VenueImageCVCell: UICollectionViewCell {
    
    // MARK: - UI Objects
    lazy var venueImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemPink
       return iv
    }()
    
    lazy var venueNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(venueImage)
        contentView.addSubview(venueNameLabel)
        constrainVenueImage()
        constrainVenueLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Contraint Methods
    private func constrainVenueImage() {
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        
        [venueImage.topAnchor.constraint(equalTo: contentView.topAnchor), venueImage.leadingAnchor.constraint(equalTo: leadingAnchor), venueImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), venueImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)].forEach({$0.isActive = true})
    }
    
    private func constrainVenueLabel() {
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [venueNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor), venueNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), venueNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor), venueNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)].forEach({$0.isActive = true})
    }
}
