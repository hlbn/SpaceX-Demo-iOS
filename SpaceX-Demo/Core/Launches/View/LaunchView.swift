//
//  LaunchView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//
import Foundation
import SwiftUI
struct LaunchView: View {
    @ObservedObject var launchesApi = LaunchesApi()
    var body: some View {
        NavigationView{
            List(launchesApi.launchesData) { launches in
                NavigationLink(destination: LaunchesDetailView(launches: launches)) {
                         LaunchViewModel(launches: launches)
                  
                }
            }
            .navigationTitle("Launches")
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
