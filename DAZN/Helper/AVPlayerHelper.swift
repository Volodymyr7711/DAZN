//
//  AVPlayerManager.swift
//  DAZN
//
//  Created by Volodymyr Mendyk on 15/05/2023.
//

import Foundation
import AVFoundation

class AVPlayerHelper {
    static let shared = AVPlayerHelper()

    var player: AVPlayer?

    func play() {
        guard let player = player else { return }
        player.play()
    }

    func pause() {
        guard let player = player else { return }
        player.pause()
    }
    
    func createPlayer(from url: String) -> AVPlayer? {
        guard let url = URL(string: url) else { return nil }
        return AVPlayer(url: url)
    }
}
