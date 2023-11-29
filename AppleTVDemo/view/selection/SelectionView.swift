//
//  ContentView.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import SwiftUI

struct SelectionView: View {
    @ViewModelInject
    private var viewModel: SelectionViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            Text("Shows")
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            ShowsListView(shows: viewModel.state.shows)
            Text("Movies")
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            ShowsListView(shows: viewModel.state.movies)
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .onAppear(perform: {
            viewModel.loadData()
        })
    }
}

private struct ShowsListView: View {
    private let shows: [ShowPresentationModel]
    
    init(shows: [ShowPresentationModel]) {
        self.shows = shows
    }
    
    var body: some View {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [Color.black.opacity(0.75), Color.clear]),
            startPoint: .bottom,
            endPoint: .center
        )
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top, spacing: 16) {
                ForEach(shows) { show in
                    NavigationLink(destination: PlayerView(id: show.id)) {
                        AsyncImage(url: URL(string: show.imageUrl)) { image in
                            image.resizable()
                                 .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                            .frame(width: 400, height: 200)
                            .overlay(gradient)
                            .overlay(
                                Text(show.title)
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                    .padding(.bottom, 8)
                                    .padding(.leading, 16),
                                alignment: .bottomLeading
                            )
                            .cornerRadius(16)
                    }
                    .buttonStyle(.borderless)
                }
            }.frame(height: 280)
                .padding(.top, 16)
                .listRowInsets(EdgeInsets())
        }
    
    }
}

#Preview {
    SelectionView()
}
