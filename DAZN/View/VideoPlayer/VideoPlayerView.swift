//
//  VideoPlayerView.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 15/05/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    let videoURL: String
    var navigationTitle: String

    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: AVPlayerHelper.shared.createPlayer(from: videoURL))
                .onAppear {
                    AVPlayerHelper.shared.play()
                }
                .onDisappear {
                    AVPlayerHelper.shared.pause()
                }
                .ignoresSafeArea(.all)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BackButtonView(label: navigationTitle))
    }
}


struct VideoPlayerView_Previews: PreviewProvider {
    static var navigationTitle: String = "Man City v Totenham"
    static var previews: some View {
        VideoPlayerView(videoURL: "https://www.youtube.com/watch?v=OaIn7HBlCSk",
            navigationTitle: navigationTitle
        )
    }
}
