//
//  VenueAPIClient.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/4/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class VenueAPIClient {
    private init() {}
    
    static let shared = VenueAPIClient()
    
    func getVenues(lat: String, long: String, searchQuery: String, completionHandler: @escaping (Result<[Venue], AppError>) -> () ) {
        let urlStr = "https://api.foursquare.com/v2/venues/search?\(lat),\(long)&client_id=\(Secret.clientID)&client_secret=\(Secret.clientKey)&query=\(searchQuery)&v=20191104"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let venueInfo = try JSONDecoder().decode(Welcome.self, from: data)
                    
                    completionHandler(.success(venueInfo.response.venues))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
}
