//
//  CollectionModel.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/17/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

struct Collection: Codable {
    let name: String
    let venues: [Venue]?
}
