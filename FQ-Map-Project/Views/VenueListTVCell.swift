//
//  VenueListTVCell.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/8/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class VenueListTVCell: UITableViewCell {

    // MARK: - UI Objects
    lazy var venueImage: UIImageView = {
       let img = UIImageView()
        img.backgroundColor = .green
        return img
    }()
    
    lazy var venueNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        constrainImage()
        constrainLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        contentView.addSubview(venueImage)
        contentView.addSubview(venueNameLabel)
    }
    
    // MARK: - Constraint Methods
    private func constrainImage() {
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        
        [venueImage.topAnchor.constraint(equalTo: contentView.topAnchor), venueImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor), venueImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor), venueImage.widthAnchor.constraint(equalTo: venueImage.heightAnchor)].forEach({$0.isActive = true})
    }
    
    private func constrainLabel() {
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [venueNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor), venueNameLabel.leadingAnchor.constraint(equalTo: venueImage.trailingAnchor), venueNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.66), venueNameLabel.heightAnchor.constraint(equalTo: venueImage.heightAnchor, multiplier: 0.5)].forEach({$0.isActive = true})
    }
    
    
}
