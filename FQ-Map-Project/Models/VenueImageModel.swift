//
//  VenueImageModel.swift
//  FQ-Map-Project
//
//  Created by Liana Norman on 11/15/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import Foundation


struct ImageResponseWrapper: Codable {
    let response: ImageResponse
    
}


struct ImageResponse: Codable {
    let photos: VenueImageWrapper
}


struct VenueImageWrapper: Codable {
    let items: [VenueImage]
}


struct VenueImage: Codable {
    let prefix: String
    let suffix: String
    
    
    var imageUrlStr: String {
       return "\(prefix)original\(suffix)"
    }
    
}
