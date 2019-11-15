//
//  VenueModel.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

// MARK: - Welcome
struct Welcome: Codable {
    let response: Response
    
    static func decodeVenues(from data: Data) -> [Venue]? {
        do {
            let newVenues = try JSONDecoder().decode(Welcome.self, from: data)
            return newVenues.response.venues
        } catch let decodeError {
            print(decodeError)
            return nil
        }
    }
}

// MARK: - Response
struct Response: Codable {
    let venues: [Venue]
}

// MARK: - Venue
struct Venue: Codable {
    let id, name: String
    let location: Location?
    let categories: [Category]?
    let hasPerk: Bool

}

// MARK: - Category
struct Category: Codable {
    let id, name, pluralName, shortName: String
    let primary: Bool
}



// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
    let distance: Int
    let formattedAddress: [String]
}



