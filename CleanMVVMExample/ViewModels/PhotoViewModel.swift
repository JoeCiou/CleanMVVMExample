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
    let series: PhotoSeries
    let index: Int
    
    private var photo: Photo {
        return PhotoManager.shared.photo(series: series, index: index)
    }
    var name: String {
        return photo.name
    }
    var imageName: String {
        return photo.imageName
    }
    var favorite: Bool {
        return photo.favorite
    }
    
    init(series: PhotoSeries, index: Int) {
        self.series = series
        self.index = index
    }
    
    func switchFavorite() {
        PhotoManager.shared.switchFavorite(series: series, index: index)
        delegate?.didUpdateFavorite()
    }
}
