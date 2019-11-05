//
//  SearchVC.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchVC: UIViewController {
    
    // MARK: - UI Objects
    lazy var venueSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = .white
        sb.placeholder = "Search Venue"
        return sb
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = .white
        sb.placeholder = "Search location"
        return sb
    }()
    
    lazy var mapView: MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    lazy var venueImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setUpVCViews()
        constrainVenueSearchBar()
        constrainLocationSearchBar()
        constrainMapView()
        constrainCollectionView()
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(venueSearchBar)
        view.addSubview(locationSearchBar)
        view.addSubview(mapView)
        view.addSubview(venueImageCollectionView)
    }
    
    private func setUpVCViews() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    // MARK: - Constraint Methods
    private func constrainVenueSearchBar() {
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        [venueSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), venueSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueSearchBar.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075)].forEach({$0.isActive = true})
    }
    
    private func constrainLocationSearchBar() {
        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        [locationSearchBar.topAnchor.constraint(equalTo: venueSearchBar.bottomAnchor), locationSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor), locationSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor), locationSearchBar.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075)].forEach({$0.isActive = true})
    }
    
    private func constrainMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        [mapView.topAnchor.constraint(equalTo: locationSearchBar.bottomAnchor), mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor), mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor), mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
    
    private func constrainCollectionView() {
        venueImageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        [venueImageCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35), venueImageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueImageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueImageCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.125)].forEach({$0.isActive = true})
    }
}
