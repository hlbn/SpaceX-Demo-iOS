//
//  LaunchRowView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//

import SwiftUI

struct LaunchRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            HStack(alignment: .center,spacing: 20) {
                Circle()
                    .frame(width: 100, height: 100)
                    .padding()
                
                VStack(spacing: 10) {
                    
                        Text("Putnik")
                            .font(.headline)
                            .padding()
                        
                        Text("2020-05-22T17:39:00.000Z")
                        .font(.subheadline)
                        
                }
            }
            Divider()
        }
    }
}

struct LaunchRowView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchRowView()
    }
}
