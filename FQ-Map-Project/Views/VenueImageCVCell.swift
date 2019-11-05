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
}
