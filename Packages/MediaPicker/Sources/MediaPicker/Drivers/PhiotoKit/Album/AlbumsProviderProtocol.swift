//
//  AlbumsProviderProtocol.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import Combine

protocol AlbumsProviderProtocol {
    var albums: AnyPublisher<[AlbumModel], Never> { get }

    func reload()
}
