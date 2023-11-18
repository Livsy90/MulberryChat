//
//  InputViewState.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

public enum InputViewState {
    case empty
    case hasTextOrMedia
    case waitingForRecordingPermission
    case isRecordingHold
    case isRecordingTap
    case hasRecording
    case playingRecording
    case pausedRecording

    var canSend: Bool {
        switch self {
        case .hasTextOrMedia, .hasRecording, .isRecordingTap, .playingRecording, .pausedRecording:
            return true
        case .empty, .waitingForRecordingPermission, .isRecordingHold:
            return false
        }
    }
}
