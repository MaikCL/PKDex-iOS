//
//  File.swift
//  
//
//  Created by Miguel Angel on 07-05-21.
//

import Core
import SwiftUI
import AltairMDKCommon

struct ListingScene: View {
    @ObservedObject private(set) var viewModel: ListingViewModel

    @State private var destination: Destination?
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Nav") {
                    destination = .detail(id: "")
                }.navigation(item: $destination, destination: viewModel.router.route(to:))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
