//
//  LaunchesDetailView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 29/05/2022.
//

import SwiftUI

struct LaunchesDetailView: View {
    var launches: Launches
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return formatter
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .center,spacing: 20) {
                Text(launches.name)
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                    .frame(width: 200, height: 50)
                    .background(Color.primary.opacity(0.8))
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
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
                Text("Details")
                    .font(.system(size: 20))
                    .bold()
                Text(launches.details ?? "There are no details.")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
                Link("More", destination: URL(string: launches.links.article!)!)
                Spacer()
            }
        }
    }
}

struct LaunchDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(filter: .search)
    }
}
