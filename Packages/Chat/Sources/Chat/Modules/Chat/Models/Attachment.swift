//
//  Attachment.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import MediaPicker

public struct Attachment: Codable, Identifiable, Hashable {
    public let id: String
    public let thumbnail: URL
    public let full: URL
    public let type: AttachmentKind

    public init(id: String, thumbnail: URL, full: URL, type: AttachmentKind) {
        self.id = id
        self.thumbnail = thumbnail
        self.full = full
        self.type = type
    }

    public init(id: String, url: URL, type: AttachmentKind) {
        self.init(id: id, thumbnail: url, full: url, type: type)
    }
}

public enum AttachmentKind: String, Codable {
    case image
    case video
    
    public var title: String {
        switch self {
        case .image:
            return "Image"
        default:
            return "Video"
        }
    }

    public init(_ mediaKind: MediaKind) {
        switch mediaKind {
        case .image:
            self = .image
        default:
            self = .video
        }
    }
}
