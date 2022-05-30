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
        ZStack {
            VStack {
                URLImage(urlString: launches.links.patch.small!)
            }
        }
    }
}

struct LaunchDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
