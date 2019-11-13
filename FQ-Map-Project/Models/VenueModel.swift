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
    let location: Location
    let categories: [Category]
    let hasPerk: Bool
    let venuePage: VenuePage?

}

// MARK: - Category
struct Category: Codable {
    let id, name, pluralName, shortName: String
    let primary: Bool
}


enum Suffix: String, Codable {
    case png = ".png"
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
    let labeledLatLngs: [LabeledLatLng]
    let distance: Int
    let cc: Cc
    let city: City?
    let state: State
    let country: Country
    let formattedAddress: [String]
    let address, crossStreet, postalCode: String?
}

enum Cc: String, Codable {
    case us = "US"
}

enum City: String, Codable {
    case bronx = "Bronx"
    case brooklyn = "Brooklyn"
    case jacksonHole = "Jackson hole"
    case newYork = "New York"
    case rioDeJaneiro = "Rio de Janeiro"
}

enum Country: String, Codable {
    case unitedStates = "United States"
}

// MARK: - LabeledLatLng
struct LabeledLatLng: Codable {
    let label: Label
    let lat, lng: Double
}

enum Label: String, Codable {
    case display = "display"
}

enum State: String, Codable {
    case newYork = "New York"
    case ny = "NY"
}


// MARK: - VenuePage
struct VenuePage: Codable {
    let id: String
}
