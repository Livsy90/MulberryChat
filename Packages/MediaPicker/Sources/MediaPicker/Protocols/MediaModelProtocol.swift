//
//  MediaModelProtocol.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

protocol MediaModelProtocol {
    var mediaType: MediaType? { get }
    var duration: CGFloat? { get }

    func getURL() async -> URL?
    func getThumbnailURL() async -> URL?

    func getData() async throws -> Data?
    func getThumbnailData() async -> Data?
}
