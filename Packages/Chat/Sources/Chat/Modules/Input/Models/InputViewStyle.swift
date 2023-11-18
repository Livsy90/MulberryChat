//
//  InputViewStyle.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

public enum InputViewStyle {
    case message
    case signature

    var placeholder: String {
        switch self {
        case .message:
            return "Type a message..."
        case .signature:
            return "Add signature..."
        }
    }
}
