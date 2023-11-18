//
//  DraftMessage.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import MediaPicker

public struct DraftMessage {
    public var id: String?
    public let text: String
    public let medias: [Media]
    public let recording: Recording?
    public let replyMessage: ReplyMessage?
    public let createdAt: Date
}
