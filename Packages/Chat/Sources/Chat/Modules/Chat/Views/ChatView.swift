//
//  ChatView.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

public struct ChatView<MessageContent: View, InputViewContent: View>: View {
    
    /// To build a custom message view use the following parameters passed by this closure:
    /// - message containing user, attachments, etc.
    /// - position of message in its continuous group of messages from the same user
    /// - pass attachment to this closure to use ChatView's fullscreen media viewer
    public typealias MessageBuilderHandler = ((Message, PositionInGroup, @escaping (Attachment) -> Void) -> MessageContent)

    /// To build a custom input view use the following parameters passed by this closure:
    /// - binding to the text in input view
    /// - InputViewAttachments to store the attachments from external pickers
    /// - Current input view state
    /// - .message for main input view mode and .signature for input view in media picker mode
    /// - closure to pass user interaction, .recordAudioTap for example
    /// - dismiss keyboard closure
    public typealias InputViewBuilderHandler = ((Binding<String>, InputViewAttachments, InputViewState, InputViewStyle, @escaping (InputViewAction) -> Void, () -> Void) -> InputViewContent)

    /// User and MessageId
    public typealias TapAvatarHandler = (User, String) -> Void
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
