//
//  ThumbnailPlaceholder.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

struct ThumbnailPlaceholder: View {

    var body: some View {
        Rectangle()
            .fill(.gray.opacity(0.3))
            .aspectRatio(1, contentMode: .fill)
    }
}
