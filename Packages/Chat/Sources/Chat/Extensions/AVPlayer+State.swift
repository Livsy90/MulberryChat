//
//  AVPlayer+State.swift
//
//
//  Created by Livsy on 20.11.2023.
//

import AVFoundation

extension AVPlayer {
    var isPlaying: Bool {
        return rate != 0 && error == nil
    }
}
