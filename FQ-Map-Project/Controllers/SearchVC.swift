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
        sb.tag = 0
        return sb
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = .white
        sb.placeholder = "Search location"
        sb.tag = 1
        return sb
    }()
    
    lazy var venueListButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "list.dash"), for: .normal)
        btn.addTarget(self, action: #selector(listVenueButtonPressed), for: .touchUpInside)
        btn.showsTouchWhenHighlighted = true
        return btn
    }()
    
    lazy var mapView: MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    lazy var venueImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(VenueImageCVCell.self, forCellWithReuseIdentifier: "VenueImageCVCell")
        return cv
    }()
    
    // MARK: - Properties
    private let locationManager = CLLocationManager()
    
    private var currentLocation = CLLocationCoordinate2D(latitude: 40.742054, longitude: -73.769417) {
        didSet {
            self.loadVenueSearchData(lat: currentLocation.latitude, long: currentLocation.longitude, searchQuery: venueSearchString ?? "")
        }
    }
    private let searchRadius: Double = 1000
    
    private var venues = [Venue]() {
        didSet {
           addAndRemoveAnnotations(venues: venues)
        }
    }
    
    private var venueSearchString: String? = nil {
        didSet {
            loadVenueSearchData(lat: currentLocation.latitude, long: currentLocation.longitude, searchQuery: venueSearchString!)
        }
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        delegation()
        addSubviews()
        setUpVCViews()
        constrainVenueSearchBar()
        constrainLocationSearchBar()
        constrainMapView()
        constrainCollectionView()
        constrainListButton()
        locationAuthorization()
        mapView.userTrackingMode = .follow
    }
    
    // MARK: - Actions
    @objc func listVenueButtonPressed() {
        let venueListVC = VenueListVC()
        self.navigationController?.pushViewController(venueListVC, animated: true)
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(venueSearchBar)
        view.addSubview(locationSearchBar)
        view.addSubview(mapView)
        view.addSubview(venueImageCollectionView)
        view.addSubview(venueListButton)
    }
    
    private func setUpVCViews() {
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    private func delegation() {
        venueImageCollectionView.dataSource = self
        venueImageCollectionView.delegate = self
        mapView.delegate = self
        locationManager.delegate = self
        venueSearchBar.delegate = self
        locationSearchBar.delegate = self
    }
    
    private func locationAuthorization() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        default:
            locationManager.requestWhenInUseAuthorization()
            
            
        }
    }
    
    private func addAndRemoveAnnotations(venues: [Venue]) {
        // below will facilitate removing annotations
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
        for venue in venues {
            let newAnnotation = MKPointAnnotation()
            newAnnotation.title = venue.name
            newAnnotation.coordinate = CLLocationCoordinate2D(latitude: venue.location?.lat ?? 40.742054, longitude: venue.location?.lng ?? -73.769417)
            mapView.addAnnotation(newAnnotation)
        }
    }
    
    private func loadVenueSearchData(lat: Double, long: Double, searchQuery: String) {
        VenueAPIClient.shared.getVenues(lat: lat, long: long, searchQuery: searchQuery) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let venuesFromOnline):
                    self?.venues = venuesFromOnline
                }
            }
        }
    }
    
    // MARK: - Constraint Methods
    private func constrainVenueSearchBar() {
        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        [venueSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), venueSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueSearchBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85), venueSearchBar.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.075)].forEach({$0.isActive = true})
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
    
    private func constrainListButton() {
        venueListButton.translatesAutoresizingMaskIntoConstraints = false
        
        [venueListButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), venueListButton.widthAnchor.constraint(equalTo: venueListButton.heightAnchor), venueListButton.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueListButton.heightAnchor.constraint(equalTo: venueSearchBar.heightAnchor)].forEach({$0.isActive = true})
    }
}

// MARK: - Extensions
extension SearchVC: UICollectionViewDelegate {}

extension SearchVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = venueImageCollectionView.dequeueReusableCell(withReuseIdentifier: "VenueImageCVCell", for: indexPath) as? VenueImageCVCell {
            cell.backgroundColor = .red
            return cell
        }
        return UICollectionViewCell()
    }
}

extension SearchVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension SearchVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("New location: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Authorization status changed to: \(status.rawValue)")
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
}

extension SearchVC: MKMapViewDelegate {}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        venueSearchString = searchText
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        venueSearchBar.showsCancelButton = true
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        venueSearchBar.showsCancelButton = false
        venueSearchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        switch searchBar.tag {
        case 0:
            guard searchBar.text != "" && searchBar.text != nil else { return }
            venueSearchString = searchBar.text
        case 1:
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.center = self.view.center
            view.addSubview(activityIndicator)
            
            venueSearchBar.resignFirstResponder()
            
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = locationSearchBar.text
            let activeSearch = MKLocalSearch(request: searchRequest)
            
            activeSearch.start { (response, error) in
                activityIndicator.stopAnimating()
                
                if response == nil {
                    print(error)
                } else {
                    let latitude = response?.boundingRegion.center.latitude
                    let longitude = response?.boundingRegion.center.longitude
                    
                    let newAnnotation = MKPointAnnotation()
                    newAnnotation.title = searchBar.text
                    
                    // Instead of force unwrapping lat and long, maybe show an alert that says that the map cannot find that location
                    newAnnotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
                    self.mapView.addAnnotation(newAnnotation)
                    
                    let coordinateRegion = MKCoordinateRegion.init(center: newAnnotation.coordinate, latitudinalMeters: self.searchRadius * 2.0, longitudinalMeters: self.searchRadius * 2.0)
                    self.mapView.setRegion(coordinateRegion, animated: true)
                }
            }
        default:
            print("This search bar does not exist")
        }
        
    }
}
