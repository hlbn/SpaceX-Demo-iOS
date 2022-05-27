//
//  Services.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//

import Foundation

struct LaunchesData: Codable {
    let launches: [Launches]
}

struct Launches: Codable {
    let id: String
    let name: String
    let links: Links
    let staticFireDateUTC: String
    let rocket: String
    let crew: [String]
    let success: Bool
    let details: String
    let launchpad: String
    let flightNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case links
        case staticFireDateUTC = "static_fire_date_utc"
        case rocket, success, details, launchpad, crew
        case flightNumber = "flight_number"
    }
}

struct Links: Codable {
    let patch: Patch
    let flickr: Flickr
    
    enum CodingKeys: String, CodingKey {
        case patch, flickr
    }
}

struct Flickr: Codable {
    let original: [String]
}

struct Patch: Codable {
    let small, large: String
}