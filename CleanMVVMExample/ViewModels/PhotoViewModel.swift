//
//  PhotoViewModel.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import Foundation

@objc protocol PhotoViewModelDelegate {
    
    func didUpdateFavorite()
}

final class PhotoViewModel {
    
    weak var delegate: PhotoViewModelDelegate?
    private var photo: Photo
    
    var name: String {
        return photo.name
    }
    var imageName: String {
        return photo.imageName
    }
    var favorite: Bool {
        return photo.favorite
    }
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func switchFavorite() {
        photo.favorite = !photo.favorite
        delegate?.didUpdateFavorite()
    }
}
