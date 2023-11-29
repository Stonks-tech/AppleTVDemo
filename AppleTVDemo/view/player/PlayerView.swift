//
//  PlayerView.swift
//  AppleTVDemo
//
//  Created by Jakub Neukirch on 29/11/2023.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    @ViewModelInject
    private var viewModel: PlayerViewModel
    let id: String
    
    init(id: String) {
        self.id = id
        viewModel.loadData(id: id)
    }
    
    var body: some View {
        if(viewModel.state.show != nil) {
            ShowVideoPlayer(url: viewModel.state.show!.videoUrl)
        }
    }
}

private struct ShowVideoPlayer : View {
    private var player: AVPlayer
    init(url: String) {
        player = AVPlayer(url: URL(string: url)!)
    }
    
    var body: some View {
        VideoPlayer(player: player)
            .onAppear {
                player.play()
            }
    }
}

#Preview {
    PlayerView(id: "1")
}
