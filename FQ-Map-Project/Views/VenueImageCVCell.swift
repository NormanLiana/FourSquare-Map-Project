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
        label.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        label.text = "Hello"
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
        
        [venueNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95), venueNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3), venueNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor), venueNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)].forEach({$0.isActive = true})
    }
}
