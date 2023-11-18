//
//  Types.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

public typealias MediaPickerHandler = ([Media]) -> Void
public typealias MediaPickerOrientationHandler = (ShouldLock) -> Void
public typealias DefaultHandler = () -> Void

public enum ShouldLock {
    case lock, unlock
}
