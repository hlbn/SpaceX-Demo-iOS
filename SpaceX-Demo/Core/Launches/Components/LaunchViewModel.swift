//
//  LaunchViewModel.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 29/05/2022.
//

import SwiftUI

struct LaunchViewModel: View {
    @StateObject var launches = LaunchesApi()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return formatter
    }
    
    var body: some View {
       NavigationView{
            List{
                ForEach(launches.launchesData,id: \.self) { launches in
                    HStack(alignment: .top) {
                        URLImage(urlString: launches.links.patch.large!)
                        Divider()
                        VStack(alignment: .leading){
                        Text(launches.name)
                                .font(.headline)
                            .bold()
                            .padding()
                            HStack(alignment: .top){
                            Text("Success")
                                .font(.subheadline)
                                .bold()
                            Circle()
                                .frame(width: 18, height: 18, alignment: .center)
                                .foregroundColor(launches.success == true ? Color.green : Color.red)
                            
                        }
                            .padding()
                            
                            //Text(launches.launchpad)
                            
                            
                            Text(dateFormatter.string(from: launches.date))
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            
                                
                    }
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

struct LaunchViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
