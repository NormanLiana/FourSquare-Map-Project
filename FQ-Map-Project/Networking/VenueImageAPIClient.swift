//
//  VenueImageAPIClient.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/15/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation

class VenueImageAPIClient {

    static let shared = VenueImageAPIClient()

    func getVenueImages(venueID: String, completionHandler: @escaping (Result<[VenueImage], AppError>) -> () ) {

        let urlStr = "https://api.foursquare.com/v2/venues/\(venueID)/photos?client_id=\(Secret.clientID)&client_secret=\(Secret.clientKey)&v=20180323&limit=2"
        
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
                    let venueImage = try JSONDecoder().decode(ImageResponseWrapper.self, from: data)
                    completionHandler(.success(venueImage.response.photos.items))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
}
