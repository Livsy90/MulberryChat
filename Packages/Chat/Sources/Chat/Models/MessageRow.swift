//
//  File.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

public enum PositionInGroup {
    case first
    case middle
    case last
    case single
}

struct MessageRow: Equatable {
    let message: Message
    let positionInGroup: PositionInGroup

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id && lhs.positionInGroup == rhs.positionInGroup && lhs.message.status == rhs.message.status
    }
}

extension MessageRow: Identifiable {
    public typealias ID = String
    public var id: String {
        return message.id
    }
}
