//
//  Service.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//
import Foundation
import Combine
import SwiftUI

class LaunchesApi: ObservableObject {
    
    @Published var launchesData: [Launches] = []
    @Published var appError: ErrorType? = nil
    
    init(){
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/past")
        else {
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let taskLaunches = URLSession.shared.dataTask(with: url) { [weak self]
            data, response, error in
            guard let data = data, error == nil else {
                self?.appError = ErrorType(error: .loadError)
                return
            }
            do{
                let launchesData = try decoder.decode([Launches].self, from: data)
                DispatchQueue.main.async {
                    self?.launchesData = launchesData
                }
            } catch {
                self?.appError = ErrorType(error: .loadError)
                print(error)
            }
        }
        taskLaunches.resume()
    }
}


