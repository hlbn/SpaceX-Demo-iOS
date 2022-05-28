//
//  LaunchView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//

import SwiftUI

struct LaunchView: View {
    @StateObject var launches = LaunchesApi()
    
    var body: some View {
       NavigationView{
            List{
                ForEach(launches.launchesData,id: \.self) { launches in
                    HStack {
                        URLImage(urlString: launches.links.patch.large!)
                        Divider()
                        Text(launches.name)
                            .bold()
                            .padding()
                    }
                    .padding()
                }
            }
            .navigationTitle("Launches")
            .onAppear{
                launches.fetch()
            }
        }
       .navigationViewStyle(.stack)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
