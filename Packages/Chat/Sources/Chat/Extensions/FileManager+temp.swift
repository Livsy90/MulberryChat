//
//  File.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import Foundation

extension FileManager {

    static var tempDirPath: URL {
        URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    }

    static var tempFile: URL {
        FileManager.tempDirPath.appendingPathComponent(UUID().uuidString)
    }

    static var tempAudioFile: URL {
        FileManager.tempDirPath.appendingPathComponent(UUID().uuidString + ".aac")
    }
}
