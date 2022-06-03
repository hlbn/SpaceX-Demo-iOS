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
        case search, succeded, failed
    }
    @StateObject var launchesApi = LaunchesApi()
    @State var searchText = ""
    @State var isPresented = false
    @State var filter: FilterType
    var body: some View {
        NavigationView{
            List{
                ForEach(filteredLaunches, id: \.self) { launches in
                    NavigationLink(
                        destination: LaunchesDetailView(launches: launches)) {
                         LaunchViewModel(launches: launches)
                  
                  }
               }
            }
            .navigationTitle("Launches")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Filter"){
                        isPresented = true
                        }
                    }
                }
            }
            .confirmationDialog("", isPresented: $isPresented){
                Button("Succeded"){filter = .succeded}
                Button("Failed"){filter = .failed}
                Button("All"){filter = .search}
            } message: {
                Text("Show")
            }
        }
    var filteredLaunches: [Launches] {
        switch filter {
        case .search:
            return launchesApi.launchesData.filter({
                searchText.isEmpty ? true : "\($0)".contains(searchText)})
        case .succeded:
            return launchesApi.launchesData.filter {$0.success}
        case .failed:
            return launchesApi.launchesData.filter {!$0.success}
        }
    }
}
    


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(filter: .search)
    }
}
