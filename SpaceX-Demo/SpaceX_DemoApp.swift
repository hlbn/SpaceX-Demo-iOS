//
//  SpaceX_DemoApp.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 26/05/2022.
//

import SwiftUI

@main
struct SpaceX_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView(filter: .search)
        }
    }
}
