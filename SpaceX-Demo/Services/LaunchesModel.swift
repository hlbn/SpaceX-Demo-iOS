//
//  Services.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//

import Foundation


struct Launches: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let links: Links
    let date: Date
    let rocket: String
    let crew: [String]
    let success: Bool
    let details: String?
    let launchpad: String
    let flightNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case links
        case date = "date_local"
        case rocket, success, details, launchpad, crew
        case flightNumber = "flight_number"
    }
}


struct Links:Hashable, Codable {
    let patch: Patch
    let article: String?
    
    enum CodingKeys: String, CodingKey {
        case patch
        case article
    }
}


struct Patch:Hashable, Codable {
    let small, large: String?
}

