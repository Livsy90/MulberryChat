//
//  ModeSwitcher.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

public struct ModeSwitcher: View {

    @Binding var selection: Int

    public var body: some View {
        Picker("", selection: $selection) {
            Text("Photos")
                .tag(0)
            Text("Albums")
                .tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(maxWidth: UIScreen.main.bounds.width / 2)
    }
}
