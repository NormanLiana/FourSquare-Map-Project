//
//  VenueDVC.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class VenueDVC: UIViewController {
    
    // MARK: - UI Objects
    lazy var venueImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemPink
       return iv
    }()
    
    lazy var venueNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.font = label.font.withSize(30)
        return label
    }()
    
    // MARK: - Properties
    var selectedVenue: Venue!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        constrainNameLabel()
        constrainImage()
        setUpViews()
        setUpVCViews()
    }
    
    // MARK: - Private Methods
    private func setUpVCViews() {
        view.backgroundColor = .white
        navigationController?.isToolbarHidden = false
    }
    
    private func addSubViews() {
        view.addSubview(venueImage)
        view.addSubview(venueNameLabel)
    }
    
    private func setUpViews() {
        venueNameLabel.text = selectedVenue.name
    }
    
    // MARK: - Contraint Methods
    private func constrainNameLabel() {
        venueNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [venueNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), venueNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueNameLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.20)].forEach({$0.isActive = true})
    }
    
    private func constrainImage() {
        venueImage.translatesAutoresizingMaskIntoConstraints = false
        
        [venueImage.topAnchor.constraint(equalTo: venueNameLabel.bottomAnchor), venueImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6)].forEach({$0.isActive = true})
    }

}
