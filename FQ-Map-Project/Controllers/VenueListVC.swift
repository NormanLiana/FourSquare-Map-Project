//
//  VenueListVC.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/8/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class VenueListVC: UIViewController {
    
    // MARK: - UI Objects
    lazy var venueTVList: UITableView = {
       let tv = UITableView()
        tv.backgroundColor = .white
        tv.register(VenueListTVCell.self, forCellReuseIdentifier: "VenueListTVCell")
        return tv
    }()
    
    // MARK: - Properties
    var venuesList = [Venue]()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        delegation()
        setUpVCViews()
        addSubViews()
        constrainTableView()
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        view.addSubview(venueTVList)
    }
    
    private func delegation() {
        venueTVList.delegate = self
        venueTVList.dataSource = self

    }
    
    private func setUpVCViews() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Constriant Methods
    private func constrainTableView() {
        venueTVList.translatesAutoresizingMaskIntoConstraints = false
        
        [venueTVList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), venueTVList.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueTVList.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueTVList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
    

}

// MARK: - Extensions
extension VenueListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venuesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = venueTVList.dequeueReusableCell(withIdentifier: "VenueListTVCell", for: indexPath) as? VenueListTVCell {
            let venue = venuesList[indexPath.row]
            cell.venueNameLabel.text = venue.name
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension VenueListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
