//
//  Service.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//

import Foundation

class LaunchesApi: ObservableObject {
    @Published var launches: [Launches] = []
    
    func fetch() {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches/past")
        else {
            return
        }
        
        let taskLaunches = URLSession.shared.dataTask(with: url) { [weak self]
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let launches = try JSONDecoder().decode([Launches].self, from: data)
                DispatchQueue.main.async {
                    self?.launches = launches
                }
            } catch {
                print(error)
            }
        }
        taskLaunches.resume()
    }
}
