//
//  PhotoListViewModel.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import Foundation

@objc protocol PhotoListViewModelDelegate {
    
    func photoListViewModelDidUpdateFavorite()
    
}

protocol PhotoListViewModelInterface {
    
    weak var delegate: PhotoListViewModelDelegate? { get set }
    var photoViewModels: [PhotoViewModelInterface] { get }
    subscript(index: Int) -> PhotoViewModelInterface { get }
    func switchFavorite(at index: Int)
    
}

final class PhotoListViewModel: PhotoListViewModelInterface {
    
    weak var delegate: PhotoListViewModelDelegate?
    private(set) var photoViewModels: [PhotoViewModelInterface] = []
    
    subscript(index: Int) -> PhotoViewModelInterface {
        return photoViewModels[index]
    }
    
    init() {
        createPhotoViewModels()
    }
    
    func createPhotoViewModels() {
        photoViewModels = Photo.defaultPhotos.map({ (photo) -> PhotoViewModelInterface in
            return PhotoViewModel(photo: photo)
        })
    }
    
    func switchFavorite(at index: Int) {
        photoViewModels[index].switchFavorite()
        delegate?.photoListViewModelDidUpdateFavorite()
    }
}


