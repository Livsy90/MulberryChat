//
//  File.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

final class GlobalFocusState: ObservableObject {
    @Published var focus: Focusable?
}
