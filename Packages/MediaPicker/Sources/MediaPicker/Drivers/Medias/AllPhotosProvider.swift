//
//  File.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import Foundation
import Photos
import Combine
import SwiftUI

final class AllPhotosProvider: BaseMediasProvider {

    override func reload() {
        PermissionsService.requestPermission { [ weak self] in
            self?.reloadInternal()
        }
    }

    func reloadInternal() {
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        let allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        let assets = MediasProvider.map(fetchResult: allPhotos, mediaSelectionType: selectionParamsHolder.mediaType)
        filterAndPublish(assets: assets)
    }
}
