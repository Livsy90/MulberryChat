//
//  SelectionParamsHolder.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

public typealias MediaPickerParameters = SelectionParamsHolder

final public class SelectionParamsHolder: ObservableObject {

    @Published public var mediaType: MediaSelectionType = .photoAndVideo
    @Published public var selectionStyle: MediaSelectionStyle = .checkmark
    @Published public var selectionLimit: Int? // if nil - unlimited
    @Published public var showFullscreenPreview: Bool = true // if false, tap on image immediately selects this image and closes the picker

    public init(
        mediaType: MediaSelectionType = .photoAndVideo,
        selectionStyle: MediaSelectionStyle = .checkmark,
        selectionLimit: Int? = nil,
        showFullscreenPreview: Bool = true
    ) {
        
        self.mediaType = mediaType
        self.selectionStyle = selectionStyle
        self.selectionLimit = selectionLimit
        self.showFullscreenPreview = showFullscreenPreview
    }
}

public enum MediaSelectionStyle {
    case checkmark
    case count
}

public enum MediaSelectionType {
    case photoAndVideo
    case photo
    case video

    var isPhotoAllowed: Bool {
        [.photoAndVideo, .photo].contains(self)
    }

    var isVideoAllowed: Bool {
        [.photoAndVideo, .video].contains(self)
    }
}
