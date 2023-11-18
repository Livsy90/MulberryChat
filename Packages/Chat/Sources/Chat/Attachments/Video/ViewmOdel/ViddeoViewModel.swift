//
//  File.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import Combine
import AVKit

// TODO: Create option "download video before playing"
final class VideoViewModel: ObservableObject {

    @Published var attachment: Attachment
    @Published var player: AVPlayer?

    @Published var isPlaying = false
    @Published var isMuted = false

    @Published var status: AVPlayer.Status = .unknown
    
    private var subscriptions = Set<AnyCancellable>()

    init(attachment: Attachment) {
        self.attachment = attachment
    }

    func onStart() {
        guard player == nil else {
            return
        }
        
        player = AVPlayer(url: attachment.full)
        player?.publisher(for: \.status)
            .assign(to: &$status)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(finishVideo),
            name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: nil
        )
    }

    func onStop() {
        pauseVideo()
    }

    func togglePlay() {
        if player?.isPlaying == true {
            pauseVideo()
        } else {
            playVideo()
        }
    }

    func toggleMute() {
        player?.isMuted.toggle()
        isMuted = player?.isMuted ?? false
    }

    func playVideo() {
        player?.play()
        isPlaying = player?.isPlaying ?? false
    }

    func pauseVideo() {
        player?.pause()
        isPlaying = player?.isPlaying ?? false
    }

    @objc func finishVideo() {
        player?.seek(to: CMTime(seconds: 0, preferredTimescale: 10))
        isPlaying = false
    }
}
