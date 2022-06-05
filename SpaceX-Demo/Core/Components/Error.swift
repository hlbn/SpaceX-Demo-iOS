//
//  Error.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 05/06/2022.
//

import Foundation

enum LaunchesError: Error, LocalizedError {
    case loadError
    
    var errorDescription: String? {
        switch self {
            
        case .loadError:
            return NSLocalizedString("Could not load launches, please check your internet connection or try to reload app ", comment: "")
        }
    }
}

struct ErrorType: Identifiable {
    let id = UUID()
    let error: LaunchesError
}
 
