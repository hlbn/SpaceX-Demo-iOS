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
                ForEach(launches.launches,id: \.self) { launches in
                    HStack {
                        Image("")
                            .frame(width: 120, height: 120)
                            .background(Color.gray)
                        Text(launches.name)
                            .bold()
                    }
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
