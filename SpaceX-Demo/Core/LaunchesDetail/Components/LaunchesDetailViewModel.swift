//
//  LaunchesDetailViewModel.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 03/06/2022.
//

import SwiftUI

struct LaunchesDetailViewModel: View {
    var launches: Launches
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return formatter
    }
    var body: some View {
        VStack(alignment: .center,spacing: 10) {
            Text(launches.name)
                .font(.system(size: 30))
                .fontWeight(.medium)
                .frame(idealWidth: .infinity)
                .padding()
                .background(Color.primary.opacity(0.8))
                .foregroundColor(Color.white)
                .cornerRadius(20)
            HStack{
                Text("Flight Number:")
                    .font(.subheadline)
            Text(String(launches.flightNumber))
                    .font(.subheadline)
            }
            Divider()
            URLImage(urlString: launches.links.patch.large!)
                .frame(width: 200, height: 200)
                .padding()
            Divider()
            Text(dateFormatter.string(from: launches.date))
                .font(.subheadline)
                .foregroundColor(Color.gray)
            HStack{
                Text("Success:")
                    .font(.system(size: 20))
                    .bold()
                Circle()
                    .frame(width: 22, height: 22, alignment: .center)
                    .foregroundColor(launches.success == true ? Color.green : Color.red)
            }
            HStack(alignment: .center, spacing: 10){
            Text("Details")
                .font(.system(size: 20))
                .bold()
            if launches.links.article != nil {
                Link("More", destination: URL(string: launches.links.article!)!)
                    .font(.caption)
            } else {
                    Text("")
            }
        }
            Text(launches.details ?? "There are no details.")
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
            Spacer()
        }
    }
}

struct LaunchesDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(filter: .all)
    }
}
