//
//  KeyboardState.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import Combine
import UIKit

public final class KeyboardState: ObservableObject {
    @Published private(set) public var isShown: Bool = false

    private var subscribtions = Set<AnyCancellable>()

    init() {
        subscribeKeyboardNotifications()
    }
}

private extension KeyboardState {
    func subscribeKeyboardNotifications() {
        Publishers.Merge(
            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillShowNotification)
                .map { _ in true },

            NotificationCenter.default
                .publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in false }
        )
        .receive(on: RunLoop.main)
        .assign(to: \.isShown, on: self)
        .store(in: &subscribtions)
    }
}
