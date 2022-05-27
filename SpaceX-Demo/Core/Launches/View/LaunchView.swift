//
//  LaunchView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        TabView{
            LaunchRowView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
