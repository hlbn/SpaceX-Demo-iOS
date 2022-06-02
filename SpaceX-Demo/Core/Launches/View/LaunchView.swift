//
//  LaunchView.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 27/05/2022.
//
import Foundation
import SwiftUI
struct LaunchView: View {
    @State var isPresented = false
    @StateObject var launchesApi = LaunchesApi()
    @State var searchText = ""
    var body: some View {
        NavigationView{
            List{
                ForEach(results, id: \.self) { launches in
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
                Button("Succeded"){}
                Button("Failed"){}
            } message: {
                Text("Show only")
            }
        }
    var results: [Launches] {
        if searchText.isEmpty {
            return launchesApi.launchesData
        } else {
            return launchesApi.launchesData.filter { "\($0)".contains(searchText)}
        }
    }
}
    


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
