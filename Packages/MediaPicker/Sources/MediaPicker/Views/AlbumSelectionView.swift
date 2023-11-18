//
//  AlbumSelectionView.swift
//
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

public struct AlbumSelectionView: View {

    @ObservedObject var viewModel: MediaPickerViewModel

    @Binding var showingCamera: Bool
    @Binding var isInFullscreen: Bool
    @Binding var currentFullscreenMedia: Media?

    let showingLiveCameraCell: Bool
    let selectionParamsHolder: SelectionParamsHolder
    let filterClosure: MediaPicker.FilterClosure?
    let massFilterClosure: MediaPicker.MassFilterClosure?
    var shouldDismiss: DefaultHandler

    @State private var showingLoadingCell = false

    public var body: some View {
        switch viewModel.internalPickerMode {
        case .photos:
            AlbumView(
                viewModel: AlbumViewModel(
                    mediasProvider: AllPhotosProvider(selectionParamsHolder: selectionParamsHolder, filterClosure: filterClosure, massFilterClosure: massFilterClosure, showingLoadingCell: $showingLoadingCell)
                ),
                showingCamera: $showingCamera,
                isInFullscreen: $isInFullscreen,
                currentFullscreenMedia: $currentFullscreenMedia,
                shouldShowCamera: showingLiveCameraCell,
                shouldShowLoadingCell: showingLoadingCell,
                selectionParamsHolder: selectionParamsHolder,
                shouldDismiss: shouldDismiss
            )
        case .albums:
            AlbumsView(
                viewModel: AlbumsViewModel(
                    albumsProvider: viewModel.defaultAlbumsProvider
                ),
                mediaPickerViewModel: viewModel,
                showingCamera: $showingCamera,
                currentFullscreenMedia: $currentFullscreenMedia,
                selectionParamsHolder: selectionParamsHolder,
                filterClosure: filterClosure,
                massFilterClosure: massFilterClosure
            )
            .onAppear {
                viewModel.defaultAlbumsProvider.mediaSelectionType = selectionParamsHolder.mediaType
            }
        case .album(let album):
            if let albumModel = viewModel.getAlbumModel(album) {
                AlbumView(
                    viewModel: AlbumViewModel(
                        mediasProvider: AlbumMediasProvider(album: albumModel, selectionParamsHolder: selectionParamsHolder, filterClosure: filterClosure, massFilterClosure: massFilterClosure, showingLoadingCell: $showingLoadingCell)
                    ),
                    showingCamera: $showingCamera,
                    isInFullscreen: $isInFullscreen,
                    currentFullscreenMedia: $currentFullscreenMedia,
                    shouldShowCamera: false,
                    shouldShowLoadingCell: showingLoadingCell,
                    selectionParamsHolder: selectionParamsHolder,
                    shouldDismiss: shouldDismiss
                )
                .id(album.id)
            }
        default:
            EmptyView()
        }
    }
}
