//
//  LaunchesDetailView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 29/05/2022.
//

import SwiftUI

struct LaunchesDetailView: View {
    var launches: Launches
    var body: some View {
        ScrollView {
            LaunchesDetailViewModel(launches: launches)
        }
    }
}

struct LaunchDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(filter: .all)
    }
}
