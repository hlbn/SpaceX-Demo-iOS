//
//  LaunchView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//
import Foundation
import SwiftUI

struct LaunchView: View {
    enum FilterType {
        case all, succeded, failed, newest, oldest
    }
    @StateObject var launchesApi = LaunchesApi()
    @State var searchText = ""
    @State var launchSort = false
    @State var filter: FilterType
    var body: some View {
        NavigationView{
            List(filteredLaunches.filter({searchText.isEmpty ? true : "\($0)".contains(searchText)}), id: \.self){ launches in
                    NavigationLink(
                        destination: LaunchesDetailView(launches: launches)) {
                         LaunchViewModel(launches: launches)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search")
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("SpaceX")
                        .font(.title)
                    }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Sort"){
                        launchSort = true
                        }
                    }
                }
            }
            .confirmationDialog("", isPresented: $launchSort){
                Button("Newest"){filter = .newest}
                Button("Oldest"){filter = .oldest}
                Button("Succeded"){filter = .succeded}
                Button("Failed"){filter = .failed}
                Button("All"){filter = .all}
            } message: {
                Text("Sort by")
            }
        }
    
    var filteredLaunches: [Launches] {
        switch filter {
        case .all:
            return launchesApi.launchesData
        case .succeded:
            return launchesApi.launchesData.filter{
                $0.success}
        case .failed:
            return launchesApi.launchesData.filter{
                !$0.success}
        case .oldest:
            return launchesApi.launchesData.sorted{
                $0.date < $1.date}
        case .newest:
            return launchesApi.launchesData.sorted{
                $0.date > $1.date}
        }
    }
}
    


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(filter: .all)
    }
}
