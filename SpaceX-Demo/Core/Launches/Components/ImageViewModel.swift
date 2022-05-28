//
//  ImageViewModel.swift
//  SpaceX-Demo
//
//  Created by Adam Hlubina on 28/05/2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage =  UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: 120, height: 120)
        }else{
            Image(systemName: "x.square")
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.white)
                .foregroundColor(Color.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _,_ in
            self.data = data
        }
        task.resume()
    }
}
