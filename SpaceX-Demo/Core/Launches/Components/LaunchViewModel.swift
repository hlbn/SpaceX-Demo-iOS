//
//  LaunchViewModel.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 29/05/2022.
//

import SwiftUI

struct LaunchViewModel: View {
    var launches: Launches
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return formatter
    }
    
    var body: some View {
                     
                    HStack(alignment: .top) {
                        URLImage(urlString: launches.links.patch.large!)
                            .frame(width: 120, height: 120)
                        Divider()
                        VStack(alignment: .leading){
                        Text(launches.name)
                                .font(.headline)
                            .bold()
                            .padding()
                            HStack(alignment: .top){
                            Text("Success:")
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
            

struct LaunchViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
