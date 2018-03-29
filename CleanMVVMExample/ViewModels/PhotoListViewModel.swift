//
//  PhotoListViewModel.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import Foundation

@objc protocol PhotoListViewModelDelegate {
    
}

final class PhotoListViewModel {
    
    weak var delegate: PhotoListViewModelDelegate?
    private(set) var photoViewModels: [PhotoViewModel] = []
    
    subscript(index: Int) -> PhotoViewModel {
        return photoViewModels[index]
    }
    
    init() {
        createPhotoViewModels()
    }
    
    func createPhotoViewModels() {
        photoViewModels = Photo.defaultPhotos.map({ (photo) -> PhotoViewModel in
            return PhotoViewModel(photo: photo)
        })
    }
}


