//
//  ChatViewModel.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import Combine

public typealias ChatPaginationHandler = (Message) -> Void

final class ChatViewModel: ObservableObject {
    
    @Published private(set) var fullscreenAttachmentItem: Optional<Attachment> = nil
    @Published var fullscreenAttachmentPresented = false

    @Published var messageMenuRow: MessageRow?

    public var didSendMessage: (DraftMessage) -> Void = {_ in}
    
    func presentAttachmentFullScreen(_ attachment: Attachment) {
        fullscreenAttachmentItem = attachment
        fullscreenAttachmentPresented = true
    }
    
    func dismissAttachmentFullScreen() {
        fullscreenAttachmentPresented = false
        fullscreenAttachmentItem = nil
    }

    func sendMessage(_ message: DraftMessage) {
        didSendMessage(message)
    }
}
