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
        return tv
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    // MARK: - Private Methods
    private func addSubViews() {
        view.addSubview(venueTVList)
    }
    
    // MARK: - Constriant Methods
    private func constrainTableView() {
        venueTVList.translatesAutoresizingMaskIntoConstraints = false
        
        [venueTVList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), venueTVList.leadingAnchor.constraint(equalTo: view.leadingAnchor), venueTVList.trailingAnchor.constraint(equalTo: view.trailingAnchor), venueTVList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)].forEach({$0.isActive = true})
    }
    

}
