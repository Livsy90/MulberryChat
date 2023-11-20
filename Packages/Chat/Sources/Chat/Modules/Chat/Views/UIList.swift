//
//  File.swift
//  
//
//  Created by Livsy on 20.11.2023.
//

import SwiftUI

struct UIList<MessageContent: View>: UIViewRepresentable {

    typealias MessageBuilderClosure = ChatView<MessageContent, EmptyView>.MessageBuilderHandler

    @Environment(\.chatTheme) private var theme

    @ObservedObject var viewModel: ChatViewModel
    @ObservedObject var paginationState: PaginationState

    @Binding var isScrolledToBottom: Bool
    @Binding var shouldScrollToTop: () -> ()

    var messageBuilder: MessageBuilderClosure?

    let avatarSize: CGFloat
    let messageUseMarkdown: Bool
    let ids: [String]

    @State private var isScrolledToTop = false

    private let updatesQueue = DispatchQueue(label: "updatesQueue", qos: .utility)
    @State private var updateSemaphore = DispatchSemaphore(value: 1)
    @State private var tableSemaphore = DispatchSemaphore(value: 0)

    func makeUIView(context: Context) -> UITableView {
        .init()
    }

    func updateUIView(_ tableView: UITableView, context: Context) {
       
    }
}
