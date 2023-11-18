//
//  PaginationState.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

final class PaginationState: ObservableObject {
    var onEvent: ChatPaginationHandler?
    var offset: Int

    var shouldHandlePagination: Bool {
        onEvent != nil
    }

    init(
        onEvent: ChatPaginationHandler? = nil,
        offset: Int = 0
    ) {
        
        self.onEvent = onEvent
        self.offset = offset
    }

    func handle(
        _ message: Message,
        ids: [String]
    ) {
        
        guard shouldHandlePagination else {
            return
        }
        if ids.prefix(offset + 1).contains(message.id) {
            onEvent?(message)
        }
    }
}
