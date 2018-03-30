//
//  PhotoListViewModel.swift
//  CleanMVVMExample
//
//  Created by Joe on 2018/3/20.
//  Copyright © 2018年 joe. All rights reserved.
//

import Foundation

@objc protocol PhotoListViewModelDelegate {
    
    func didUpdateSeries()
}

final class PhotoListViewModel {
    
    weak var delegate: PhotoListViewModelDelegate?
    
    var series: PhotoSeries = .first {
        didSet{
            delegate?.didUpdateSeries()
        }
    }
    
    var photosNumber: Int {
        return PhotoManager.shared.photos(series: series).count
    }
    
    func photoViewModel(index: Int) -> PhotoViewModel? {
        return PhotoViewModel(series: series, index: index)
    }
}


